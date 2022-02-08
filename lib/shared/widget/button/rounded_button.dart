import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.width,
    required this.onTap,
    required this.title,
    this.height = 48,
    this.style,
    this.gradient,
    this.shadows,
    this.primary,
  }) : super(key: key);
  final double width;
  final double height;
  final String title;
  final Color? primary;
  final TextStyle? style;
  final Gradient? gradient;
  final List<BoxShadow>? shadows;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: primary,
          gradient: gradient,
          boxShadow: shadows,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
