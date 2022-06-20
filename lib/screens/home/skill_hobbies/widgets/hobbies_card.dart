import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/colorMaker.dart';

class HobbiesCard extends StatelessWidget {
  const HobbiesCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: lighten(color, 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 50, color: darken(color, 0.2)),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: darken(color, 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
