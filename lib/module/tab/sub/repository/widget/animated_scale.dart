import 'package:flutter/material.dart';

class AnimatedScale extends StatelessWidget {
  final double scale;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final Function()? onEnd;

  const AnimatedScale({
    required this.scale,
    this.curve = Curves.linear,
    required this.child,
    required this.duration,
    this.onEnd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: scale, end: scale),
        curve: curve,
        duration: duration,
        builder: (context, value, widget) {
          return Transform.scale(
            scale: value as double,
            child: child,
          );
        },
      onEnd: onEnd,
    );
  }
}
