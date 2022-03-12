import 'package:flutter/material.dart';
import 'dart:math';

class CustomCurves {
  static const cosValley = CosValleyCurve();
  static const elasticOut = ElasticOutCurve();
  static const shrinkExpand = ShrinkExpandCurve();
}

class CosValleyCurve extends Curve {
  const CosValleyCurve();

  static f(double t) => (cos(2 * pi * t) + 1) / 2;

  @override
  double transformInternal(double t) => (cos(2 * pi * t) + 1) / 2;
}

class ShrinkExpandCurve extends Curve {
  const ShrinkExpandCurve();

  @override
  double transformInternal(double t) => -sin(1.5 * pi * t);
}

class ElasticOutCurve extends Curve {
  const ElasticOutCurve([this.period = 0.8]);

  final double period;

  @override
  double transformInternal(double t) {
    final double s = period / 4.0;
    return pow(2.0, -10 * t) * sin((t - s) * (pi * 2.0) / period) + 1.0;
  }

  ElasticOutCurve operator [](double p) => ElasticOutCurve(p);
}
