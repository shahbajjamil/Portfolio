import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      // forceSafariVC: false,
      // forceWebView: false,
    );
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
}

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}
