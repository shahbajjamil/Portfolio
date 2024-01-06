import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/presentation/pages/home/home_screen.dart';

class Routes {
  static const home = '/';
  static const about = '/about';
  static const projects = '/projects';
  static const contact = '/contact';
}

class AppRoute {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode ? true : false,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: Routes.home,
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      // GoRoute(
      //   path: '/about',
      //   pageBuilder: (context, state) => AboutPage(),
      // ),
      // GoRoute(
      //   path: '/projects',
      //   pageBuilder: (context, state) => ProjectsPage(),
      // ),
      // GoRoute(
      //   path: '/contact',
      //   pageBuilder: (context, state) => ContactPage(),
      // ),
    ],
  );
}
