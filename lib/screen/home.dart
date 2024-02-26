import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mocker/widget/button.dart';
import 'package:mocker/widget/system.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();
  List<dynamic> modelsNamesSaved = [];

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Mocker', items: [
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
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Mocker',
            style: headerStyle,
          ),
          Text(
            'Mocker est une application qui sert à simuler le comportement d\'une application grace à des modèles prédéfinis',
            style: subHeaderStyle,
          )
        ],
      ),
    );
  }
}
