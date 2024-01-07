import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class CustomLink extends StatelessWidget {
  const CustomLink({
    Key? key,
    required this.url,
    required this.child,
    this.linkTarget = LinkTarget.blank,
    this.builder,
  }) : super(key: key);

  final String url;
  final Widget child;
  final LinkTarget linkTarget;
  final LinkWidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    //NOTE: this is a workaround for the issue with Link not working on web
    return Link(
      uri: Uri.parse(url),
      target: linkTarget,
      builder: (context, followLink) {
        return InkWell(
          onTap: () => followLink!.call(),
          child: child,
        );
      },
    );
  }
}
