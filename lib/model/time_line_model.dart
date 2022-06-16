import 'package:flutter/material.dart';

class TimeLine {
  String date;
  String title;
  String subtitle;
  IconData icon;

  TimeLine({
    required this.date,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

List<TimeLine> timelineData = [
  TimeLine(
    date: "2014 - 2016",
    title: "Secondary School Education",
    subtitle: "Ranchi, Jharkhand",
    icon: Icons.badge_outlined,
  ),
  TimeLine(
    date: "2016 - 2018",
    title: "Higher Secondary Education",
    subtitle: "Ranchi, Jharkhand",
    icon: Icons.blinds_outlined,
  ),
  TimeLine(
    date: "2018 - 2021",
    title: "Bachelor of Computer Application",
    subtitle: "Bangalore, Karnataka",
    icon: Icons.school_outlined,
  ),
  TimeLine(
    date: "2021 - Present",
    title: "Software Developer",
    subtitle: "India",
    icon: Icons.code,
  ),
];
