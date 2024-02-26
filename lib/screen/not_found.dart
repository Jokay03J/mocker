import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mocker/widget/button.dart';
import 'package:mocker/widget/system.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Page non trouvé',
              style: headerStyle,
            ),
            BrandPrimaryButton(
              child: const Text('Retourner à l\'accueil'),
              onPress: () {
                context.pushReplacement('/');
              },
            )
          ],
        )),
        appBar: AppBar(
          title: 'Mocker',
          items: [
            NeutralPrimaryButton(
                child: const Text('Accueil'),
                onPress: () {
                  context.push('/');
                }),
            NeutralPrimaryButton(
                child: const Text('Modèles'),
                onPress: () {
                  context.push('/model');
                }),
            NeutralPrimaryButton(
                child: const Text('Serveur'),
                onPress: () {
                  context.push('/server');
                })
          ],
        ));
  }
}
