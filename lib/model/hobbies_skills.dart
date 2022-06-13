import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';

class Hobbies {
  String title;
  IconData icon;
  Color color;
  Hobbies({required this.title, required this.icon, required this.color});
}

class Skills {
  String title;
  double value;
  Color color;
  Skills({required this.title, required this.value, required this.color});
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
    color: Colors.cyan,
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
  Hobbies(
    title: "Swimming",
    icon: Icons.snowmobile_rounded,
    color: Colors.blue,
  ),
];

List<Skills> skillsData = [
  Skills(title: "Flutter", value: .725, color: Colors.blue),
  Skills(title: "Dart", value: .7, color: Colors.pink),
  Skills(title: "HTML", value: .8, color: Colors.brown),
  Skills(title: "CSS", value: .67, color: Colors.red),
  Skills(title: "JavaScript", value: .5, color: Colors.yellow),
  Skills(title: "UI/UX", value: .3, color: Colors.pinkAccent),
  Skills(title: "Firebase", value: .767, color: Colors.teal),
  Skills(title: "React", value: .23, color: Colors.purple),
  Skills(title: "NodeJS", value: .21, color: Colors.orange),
  Skills(title: "MongoDB", value: .27, color: Colors.indigo),
  Skills(title: "PHP", value: .22, color: Colors.amber),
  Skills(title: "MySQL", value: .6, color: Colors.cyan),
  Skills(title: "Python", value: .1, color: Colors.green),
];
