import 'package:flutter/material.dart';
import 'package:portfolio/model/hobbies_skills.dart';
import 'package:portfolio/screens/home/skill_hobbies/widgets/skill_card.dart';

import '../../../utils/color.dart';
import 'widgets/hobbies_card.dart';

class SkillHobbies extends StatefulWidget {
  const SkillHobbies({Key? key}) : super(key: key);

  @override
  State<SkillHobbies> createState() => _SkillHobbiesState();
}

class _SkillHobbiesState extends State<SkillHobbies> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            AppColor.lightPink,
            AppColor.white,
          ],
        ),
      ),
      child: Row(
        children: [
          const Expanded(flex: 4, child: Hobby()),
          Expanded(flex: 4, child: Skill()),
          Expanded(flex: 3, child: Container(color: Colors.yellow)),
        ],
      ),
    );
  }
}

class Skill extends StatelessWidget {
  const Skill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "Skills",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: AppColor.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(30),
          // padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: size.height * 0.8,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: GridView.builder(
            itemCount: skillsData.length,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, i) {
              return SkillsCard(
                title: skillsData[i].title,
                value: skillsData[i].value,
                color: skillsData[i].color,
              );
            },
          ),
        ),
      ],
    );
  }
}

class Hobby extends StatelessWidget {
  const Hobby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "Hobbies",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: AppColor.black,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.all(30),
            // padding: EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: size.height * 0.8,
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]),
            child: GridView.builder(
                itemCount: hobbiesData.length,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, i) {
                  return HobbiesCard(
                      title: hobbiesData[i].title,
                      icon: hobbiesData[i].icon,
                      color: hobbiesData[i].color);
                })),
      ],
    );
  }
}
