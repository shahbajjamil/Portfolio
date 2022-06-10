import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';

class Hobbies {
  String title;
  IconData icon;
  Color color;
  Hobbies({required this.title, required this.icon, required this.color});
}

List<Hobbies> hobbiesData = [
  Hobbies(
    title: "Coding",
    icon: Icons.code,
    color: AppColor.cream,
  ),
  Hobbies(
    title: "Reading",
    icon: Icons.book,
    color: Colors.green,
  ),
  Hobbies(
    title: "Traveling",
    icon: Icons.airplanemode_active,
    color: Colors.blue,
  ),
  Hobbies(
    title: "Watching Movies",
    icon: Icons.movie,
    color: Colors.red,
  ),
  Hobbies(
    title: "Watching Series",
    icon: Icons.tv,
    color: Colors.yellow,
  ),
  Hobbies(
    title: "Playing Games",
    icon: Icons.games,
    color: Colors.purple,
  ),
  
];
