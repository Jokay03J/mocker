import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mocker/core/server.dart';
import 'package:mocker/widget/button.dart';
import 'package:mocker/widget/system.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  final box = GetStorage('logs');
  List<dynamic> logs = [];

  @override
  void initState() {
    super.initState();
    logs = box.getValues().toList();
    box.listen(() {
      setState(() {
        logs = box.getValues().toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: 'Mocker - Modèles', items: [
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
        body: Column(
          children: [
            BrandPrimaryButton(
                icon: LucideIcons.power,
                onPress: () async {
                  await startServer();
                },
                child: const Text("Démarrer")),
            for (var index = 0; index < logs.length; index++) ...[
              Text(logs[index])
            ]
          ],
        ));
  }
}
