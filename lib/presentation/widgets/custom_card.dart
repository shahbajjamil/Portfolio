import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';
import 'package:portfolio/values/values.dart';

class CustomCardData {
  IconData leadingIcon;
  IconData trailingIcon;
  Color trailingIconColor;
  Color leadingIconColor;
  Color circleBgColor;
  String title;
  String subtitle;

  CustomCardData({
    required this.leadingIcon,
    required this.trailingIcon,
    this.circleBgColor = AppColors.black,
    this.leadingIconColor = AppColors.white,
    this.trailingIconColor = AppColors.grey300,
    required this.title,
    required this.subtitle,
  });
}

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    this.width,
    this.height,
    this.offsetY = -40,
    this.elevation = Sizes.ELEVATION_4,
    this.hasAnimation = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_0,
      vertical: Sizes.PADDING_12,
    ),
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? width;
  final double? height;
  final double? elevation;
  final double offsetY;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final bool hasAnimation;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: widget.offsetY).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart),
    );
  }

  Future<void> _animateCard() async {
    if (_hovering) {
      try {
        await _controller.forward().orCancel;
      } on TickerCanceled {}
    } else {
      try {
        await _controller.reverse().orCancel;
      } on TickerCanceled {}
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.hasAnimation
        ? MouseRegion(
            onEnter: (e) => _mouseEnter(true),
            onExit: (e) => _mouseEnter(false),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, animation.value),
                  child: _buildCard(),
                );
              },
            ),
          )
        : _buildCard();
  }

  Widget _buildCard() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius,
        child: Card(
          elevation: widget.elevation,
          child: Padding(
            padding: widget.padding,
            child: Row(
              mainAxisAlignment: widget.rowMainAxisAlignment,
              crossAxisAlignment: widget.rowCrossAxisAlignment,
              children: [
                widget.leading != null
                    ? const Spacer()
                    : const SizedBox.shrink(),
                widget.leading ?? const SizedBox.shrink(),
                widget.leading != null
                    ? const Spacer()
                    : const SizedBox.shrink(),
                Column(
                  mainAxisAlignment: widget.columnMainAxisAlignment,
                  crossAxisAlignment: widget.columnCrossAxisAlignment,
                  children: [
                    const Spacer(),
                    widget.title ?? const SizedBox.shrink(),
                    widget.title != null
                        ? const SpaceH8()
                        : const SizedBox.shrink(),
                    widget.subtitle ?? const SizedBox.shrink(),
                    const Spacer(),
                  ],
                ),
                widget.trailing != null
                    ? const Spacer()
                    : const SizedBox.shrink(),
                widget.trailing ?? const SizedBox.shrink(),
                widget.trailing != null
                    ? const Spacer()
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    _animateCard();
  }
}
