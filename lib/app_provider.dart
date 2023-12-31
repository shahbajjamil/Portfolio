import 'package:flutter/material.dart';
import 'package:portfolio/app_theme.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppTheme()..getThemeMode()),
      ],
      child: child,
    );
  }
}
