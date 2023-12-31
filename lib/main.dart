import 'package:flutter/material.dart';
import 'package:portfolio/app_provider.dart';
import 'package:portfolio/app_theme.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/home/home_screen.dart';

void main() {
  runApp(const AppProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      themeMode: Provider.of<AppTheme>(context).themeMode,
      home: const HomePage(),
    );
  }
}
