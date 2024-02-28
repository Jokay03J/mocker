import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:mocker/screen/home.dart';
import 'package:mocker/screen/model.dart';
import 'package:mocker/screen/models.dart';
import 'package:mocker/screen/not_found.dart';
import 'package:mocker/screen/server.dart';
import './widget/system.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'models',
          builder: (BuildContext context, GoRouterState state) {
            return const ModelsScreen();
          },
        ),
        GoRoute(
          path: 'model/:modelName',
          builder: (BuildContext context, GoRouterState state) {
            final modelName = state.pathParameters['modelName'];
            return ModelScreen(
              modelName: modelName!,
            );
          },
          redirect: (context, state) {
            if (state.pathParameters['modelName'] == null) {
              return '/';
            }
            final box = GetStorage();
            if (!box.hasData(state.pathParameters['modelName']!)) {
              return '/';
            }
            return null;
          },
        ),
        GoRoute(
          path: 'server',
          builder: (BuildContext context, GoRouterState state) {
            return const ServerScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WidgetsApp.router(
      restorationScopeId: 'mocker',
      color: Colors.pimary,
      title: 'Mocker',
      routerConfig: _router,
      textStyle: bodyStyle,
    );
  }
}
