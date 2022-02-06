import 'package:flutter/material.dart';
import 'package:mccp_1645/module/intro/utils/step_value.dart';

enum Directions {
  leftwardIn,
  leftwardOut,
  rightwardIn,
  rightwardOut,
  upwardIn,
  upwardOut,
  downwardIn,
  downwardOut,
}

class PairedOffset {
  double dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0;

  PairedOffset(Directions direc, [double expand = 1.0]) {
    switch (direc) {
      case Directions.leftwardIn:
        dx1 = 1.0 * expand;
        break;
      case Directions.leftwardOut:
        dx2 = -1.0 * expand;
        break;
      case Directions.rightwardIn:
        dx1 = -1.0 * expand;
        break;
      case Directions.rightwardOut:
        dx2 = 1.0 * expand;
        break;
      case Directions.upwardIn:
        dy1 = 1.0 * expand;
        break;
      case Directions.upwardOut:
        dy2 = -1.0 * expand;
        break;
      case Directions.downwardIn:
        dy1 = -1.0 * expand;
        break;
      case Directions.downwardOut:
        dy2 = 1.0 * expand;
        break;
    }
  }

  Offset get begin => Offset(dx1, dy1);

  Offset get end => Offset(dx2, dy2);
}

Animation<Offset> buildOffsetTweenStepAnimation({
  required AnimationController controller,
  required int startIndex,
  required Directions direction,
  double speedFactor = 1.0,
  Curve curve = Curves.fastOutSlowIn,
}) {
  assert(startIndex + 1 < Steps.values.length);

  PairedOffset offsets = PairedOffset(direction, speedFactor);

  return Tween<Offset>(
    begin: offsets.begin,
    end: offsets.end,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        Steps.values[startIndex++],
        Steps.values[startIndex],
        curve: curve,
      ),
    ),
  );
}
