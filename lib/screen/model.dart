import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mocker/widget/button.dart';
import 'package:mocker/widget/input.dart';
import 'package:mocker/widget/select.dart';
import 'package:mocker/widget/system.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key, required this.modelName});
  final String modelName;

  @override
  State<StatefulWidget> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  final box = GetStorage();
  Map? data;
  String? _newPropertyType = 'string';
  final TextEditingController newPropertyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    data = box.read(widget.modelName);

    if (data == null) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Mocker - Modèle', items: [
        NeutralPrimaryButton(
            icon: LucideIcons.home,
            onPress: () {
              context.push('/');
            },
            child: const Text('Accueil')),
        NeutralPrimaryButton(
            icon: LucideIcons.folders,
            onPress: () {
              context.push('/models');
            },
            child: const Text('Modèles')),
        NeutralPrimaryButton(
            icon: LucideIcons.server,
            onPress: () {
              context.push('/server');
            },
            child: const Text('Serveur'))
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.modelName,
              style: headerStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            for (var modelProperty in data!.keys) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$modelProperty - ${data![modelProperty]}",
                    style: bodyStyle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DangerSecondaryButton(
                      onPress: () async {
                        final box = GetStorage();
                        final Map<String, dynamic> modelData =
                            box.read(widget.modelName);
                        modelData.remove(modelProperty);
                        await box.write(widget.modelName, modelData);
                        setState(() {
                          data = modelData;
                        });
                      },
                      icon: LucideIcons.trash2,
                      child: const Text('Supprimer'))
                ],
              ),
            ],
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Input(
                  controller: newPropertyController,
                  label: 'Nouvelle propriété',
                  onSubmit: (value) async {
                    if (value == null || _newPropertyType == null) return;
                    Map? tempData = data;
                    tempData![value] = _newPropertyType;
                    final GetStorage box = GetStorage();
                    await box.write(widget.modelName, tempData);
                    setState(() {
                      data = tempData;
                    });
                    newPropertyController.text = "";
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Le nom de la propriété est requis';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Select(
                  label: 'Type',
                  onSelected: (value) {
                    if (value == null) return;
                    setState(() {
                      _newPropertyType = value;
                    });
                  },
                  items: [
                    SelectItem(name: 'Chaîne de caractère', value: 'string'),
                    SelectItem(name: 'Nombre', value: 'number')
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Options',
              style: subHeaderStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BrandPrimaryButton(
                  onPress: () async {
                    final pathSaved = await FilePicker.platform.saveFile(
                        dialogTitle: 'Export ${widget.modelName} model',
                        fileName: '${widget.modelName}.json');
                    if (pathSaved != null) {
                      final rawData = jsonEncode(data);
                      File file = File(pathSaved);
                      await file.writeAsString(rawData);
                      await FileSaver.instance.saveFile(
                          name: '${widget.modelName}.json', file: file);
                    }
                  },
                  icon: LucideIcons.folderOutput,
                  child: const Text('Exporter'),
                ),
                const SizedBox(
                  width: 10,
                ),
                DangerPrimaryButton(
                  onPress: () {
                    final box = GetStorage();
                    box.remove(widget.modelName);
                    context.pop();
                  },
                  icon: LucideIcons.trash2,
                  child: const Text('Supprimer'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
