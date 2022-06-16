import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/fonts.dart';

import '../../../utils/screen_size.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
              top: -5,
              left: -5,
              child: Container(
                width: size.width / 2,
                child: Image.asset(
                  'assets/images/bgsplash.png',
                  color: Color(0xffFFDE89),
                  colorBlendMode: BlendMode.srcIn,
                  // width: size.width * 5 + 20,
                ),
              )),
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height,
            margin: EdgeInsets.only(right: size.width * 0.5),
            // color: Colors.green,
            child: Image.asset("assets/images/man-hi.png"),
          ),
          Column(children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Text("Get in touch with Me", style: n20_black()),
            RichText(
              text: TextSpan(
                  text: "Are you ready to ",
                  style: b35_black(),
                  children: [
                    TextSpan(
                        text: "work together?",
                        style: TextStyle(
                            backgroundColor:
                                AppColor.primaryColor.withOpacity(0.6))),
                  ]),
            ),
            Text("Let's start a Project!", style: n20_black()),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.5,
                      right: size.width * 0.05,
                      top: size.width * 0.05,
                      bottom: size.width * 0.05),
                  // color: Colors.pink,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I’m open to any communication! Feel free to contact me any convenient way! I’m always interested in hearing about new projects and opportunities. I’m also open to any new ideas and opportunities.",
                        style: n20_black(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                print("Email");
                              },
                              child: Image.asset("assets/icons/message.png",
                                  scale: 1.5)),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              print("wp");
                            },
                            child: Image.asset("assets/icons/whatsapp.png",
                                scale: 1.5),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text("Follow me on", style: b20_black()),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print("github");
                            },
                            child: Image.asset("assets/icons/github.png",
                                scale: 1.5),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              print("linkedin");
                            },
                            child: Image.asset("assets/icons/linkedin.png",
                                scale: 1.5),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              print("instagram");
                            },
                            child: Image.asset("assets/icons/instagram.png",
                                scale: 1.5),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              print("twitter");
                            },
                            child: Image.asset("assets/icons/twitter.png",
                                scale: 1.5),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              print("facebook");
                            },
                            child: Image.asset("assets/icons/facebook.png",
                                scale: 1.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )),
          ]),
        ],
      ),
    );
  }
}
