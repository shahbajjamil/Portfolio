import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/HomePage.dart';
import 'package:portfolio/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Palette.myColor,
        primaryColor: AppColor().primaryColor,
        // colorScheme: ColorScheme.fromSwatch(
        //   primarySwatch: Colors.blue,
        // ).copyWith(
        //   secondary: Colors.green,
        // ),

        // textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
      ),
      home: const HomePage(),
    );
  }
}
