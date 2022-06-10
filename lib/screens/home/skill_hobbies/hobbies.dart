import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/model/hobbies_skills.dart';
import 'package:portfolio/utils/colorMaker.dart';

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
          Expanded(
              flex: 4,
              child: Container(
                // color: Colors.red,
                child: Column(
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
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.green,
                child: Column(
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
                      padding: const EdgeInsets.all(20),
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
                    ),
                  ],
                ),
              )),
          Expanded(flex: 3, child: Container(color: Colors.yellow)),
        ],
      ),
    );
  }
}
