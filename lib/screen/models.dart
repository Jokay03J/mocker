import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mocker/widget/button.dart';
import 'package:mocker/widget/card.dart';
import 'package:mocker/widget/input.dart';
import 'package:mocker/widget/system.dart';

class ModelsScreen extends StatefulWidget {
  const ModelsScreen({super.key});

  @override
  State<ModelsScreen> createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
  final box = GetStorage();
  List<dynamic> modelsNamesSaved = [];
  final TextEditingController newModelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    modelsNamesSaved = box.getKeys<Iterable>().toList();
    box.listen(() {
      setState(() {
        modelsNamesSaved = box.getKeys<Iterable>().toList();
      });
    });
  }

  @override
  void dispose() {
    newModelController.dispose();
    super.dispose();
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Modèles',
                style: headerStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Input(
                label: 'Nom',
                controller: newModelController,
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Le nom du modèle est obligatoire !';
                  return null;
                },
                onSubmit: (modelName) async {
                  final box = GetStorage();
                  await box.write(modelName!, {});
                  if (!context.mounted) return;
                  context.push('/model/$modelName');
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DangerPrimaryButton(
                    icon: LucideIcons.eraser,
                    onPress: () {
                      final box = GetStorage();
                      box.erase();
                    },
                    child: const Text('Tout supprimé'),
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  BrandPrimaryButton(
                      onPress: () async {
                        var picker = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['json'],
                            dialogTitle: 'Select an model file');
                        if (picker != null) {
                          final file = File(picker.files.first.path!);
                          final rawContent = await file.readAsString();
                          final Map modelContent = jsonDecode(rawContent);
                          final modelName =
                              picker.files.single.name.split('.')[0];
                          final box = GetStorage();
                          box.write(modelName, modelContent);
                        }
                      },
                      icon: LucideIcons.upload,
                      child: const Text('Importer'))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var index = 0;
                      index < modelsNamesSaved.length;
                      index++) ...[
                    FilledCard(
                      title: modelsNamesSaved[index],
                      actions: [
                        BrandPrimaryButton(
                            icon: LucideIcons.edit,
                            onPress: () {
                              context.push('/model/${modelsNamesSaved[index]}');
                            },
                            child: const Text('Modifier')),
                      ],
                    )
                  ]
                ],
              )
            ],
          ),
        ));
  }
}
