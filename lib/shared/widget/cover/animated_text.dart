import 'package:flutter/material.dart';
import 'package:mccp_1645/shared/util/custom_curve.dart';

class AnimatedText extends StatefulWidget {
  final Duration duration;
  final Widget text;

  const AnimatedText({
    Key? key,
    required this.duration,
    required this.text,
  }) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  late Widget oldText;
  late Widget newText;
  double tgtVal = 0;

  @override
  void initState() {
    newText = oldText = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    newText = widget.text;
    if (newText.key == oldText.key) {
      return oldText;
    } else {
      var tmpText = oldText;
      oldText = newText;
      tgtVal += 1;
      return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: tgtVal),
        duration: widget.duration,
        builder: (ctx, double val, child) {
          var t = val - val.floor();
          return Opacity(
            opacity: CosValleyCurve.f(t),
            child: t >= 0.5 || val == tgtVal ? newText : tmpText,
          );
        },
      );
    }
  }
}
