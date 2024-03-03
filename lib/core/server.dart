import 'dart:async';

import 'package:alfred/alfred.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';
import 'package:mocker/core/validator.dart';
import 'package:mocker/shared/utils.dart';

Future<Alfred> startServer() async {
  final app = Alfred();
  final dbModel = GetStorage();
  final logs = GetStorage('logs');
  final modelNames = dbModel.getKeys().toList();

  await logs.erase();
  // Create logger for Alfred app
  var log = Logger('HttpServer');

  log.onRecord.listen((record) {
    logs.write(DateTime.now().millisecondsSinceEpoch.toString(),
        '${record.level.name}: ${record.time}: ${record.message}');
  });

  // Create custom logWriter and map to logging package
  app.logWriter = (messageFn, type) {
    switch (type) {
      case LogType.debug:
        // avoid evaluating too much debug messages
        if (log.level <= Level.FINE) {
          log.fine(messageFn());
        }
        break;
      case LogType.info:
        log.info(messageFn());
        break;
      case LogType.warn:
        log.warning(messageFn());
        break;
      case LogType.error:
        log.severe(messageFn());
        break;
    }
  };

  for (var index = 0; index < modelNames.length; index++) {
    final box = GetStorage('model-${modelNames[index]}');
    app.get('/${modelNames[index]}', (req, res) {
      List values = box.getValues().toList();
      List keys = box.getKeys().toList();
      List<Map<String, dynamic>> datas = [];

      for (var index = 0; index < values.length; index++) {
        datas.add({'id': keys[index], ...values[index]});
      }

      return {'result': datas};
    });

    app.get('/${modelNames[index]}/:id', (req, res) async {
      final id = req.params['id'];
      if (id == null || !box.hasData(id)) {
        res.statusCode = 404;
        await res.json({'error': true, 'message': 'model data not found'});
        return;
      }
      await res.json({'id': id, ...box.read<Map>(id)!});
    });

    app.post('/${modelNames[index]}', (req, res) async {
      final body = await req.bodyAsJsonMap;
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final modelBox = GetStorage();
      final modelKeys =
          modelBox.read<Map<String, dynamic>>(modelNames[index])!.keys.toList();
      final data = getOnly(body, modelKeys);
      await box.write(id, data);
      res.statusCode = 201;
      await res.json({'id': id, ...data});
    }, middleware: [((req, res) => validate(req, res, modelNames[index]))]);

    app.put('/${modelNames[index]}/:id', (req, res) async {
      final id = req.params['id'];
      if (id == null || !box.hasData(id)) {
        res.statusCode = 404;
        await res.json({'error': true, 'message': 'model data not found'});
        return;
      }
      Map? data = box.read<Map>(id);
      final modelBox = GetStorage();
      final modelKeys =
          modelBox.read<Map<String, dynamic>>(modelNames[index])!.keys.toList();
      final body = await req.bodyAsJsonMap;
      final bodyFinal = {...data!, ...getOnly(body, modelKeys)};
      await box.write(id, bodyFinal);
      await res.json({'id': id, ...bodyFinal});
    }, middleware: [
      (req, res) => validateOptional(req, res, modelNames[index])
    ]);

    app.delete('/${modelNames[index]}/:id', (req, res) async {
      final id = req.params['id'];
      if (id == null || !box.hasData(id)) {
        res.statusCode = 404;
        await res.json({'error': true, 'message': 'model data not found'});
        return;
      }
      await box.remove(id);
    });
  }

  await app.listen(3000);
  return app;
}

FutureOr validate(HttpRequest req, HttpResponse res, String modelName) async {
  final box = GetStorage();
  if (!box.hasData(modelName)) {
    res.statusCode = 401;
    await res
        .json({'error': true, 'message': 'The model must have one property'});
  }
  final body = await req.bodyAsJsonMap;
  final modelData = box.read<Map<String, dynamic>>(modelName);

  final messageError = validator(modelData!, body);
  if (messageError != null) {
    res.statusCode = 401;
    await res.json({'error': true, 'message': messageError});
  }
}

FutureOr validateOptional(
    HttpRequest req, HttpResponse res, String modelName) async {
  final box = GetStorage();
  if (!box.hasData(modelName)) {
    res.statusCode = 401;
    await res
        .json({'error': true, 'message': 'The model must have one property'});
  }
  final body = await req.bodyAsJsonMap;
  final modelData = box.read<Map<String, dynamic>>(modelName);

  for (final key in modelData!.keys) {
    modelData[key] = modelData[key] + "?";
  }

  final messageError = validator(modelData, body);
  if (messageError != null) {
    res.statusCode = 401;
    await res.json({'error': true, 'message': messageError});
  }
}
