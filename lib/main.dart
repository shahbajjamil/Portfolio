import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/app_provider.dart';
import 'package:portfolio/app_theme.dart';
import 'package:portfolio/presentation/routes/app_routes.dart';
import 'package:portfolio/values/values.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppConst.appTextLogo,
        theme: AppTheme.lightTheme,
        themeMode: Provider.of<AppTheme>(context).themeMode,
        routerConfig: AppRoute.router,
        // home: const HomePage(),
      ),
    );
  }
}
