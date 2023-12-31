import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Theme.of(context).colorScheme.primary,
      child: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
