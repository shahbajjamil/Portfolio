import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);
  
  Widget buildMenuItem({
    required String text,
    // required IconData icon,
    required VoidCallback onClicked,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: padding)),
      onPressed: onClicked,
      child: Text(
        text.toUpperCase(), //"Fun fact's"
        style: m25_black(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: AppColor().secondaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1),
          Image.asset(
            "assets/images/logo.png",
            scale: 1.5,
          ),
          Spacer(flex: 4),
          buildMenuItem(
            text: "Home",
            onClicked: () {
              print("Home");
            },
          ),
          buildMenuItem(
            text: "About",
            onClicked: () {
              print("About");
            },
          ),
          buildMenuItem(
            text: "Fun fact's",
            onClicked: () {
              print("funfact");
            },
          ),
          buildMenuItem(
            text: "My Work",
            onClicked: () {
              print("My Work");
            },
          ),
          buildMenuItem(
            text: "Contact",
            onClicked: () {
              print("Contact");
            },
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
