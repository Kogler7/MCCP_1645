import 'package:flutter/material.dart';
import 'dart:math';

class CosValleyCurve extends Curve {
  const CosValleyCurve();

  static f(double t) => (cos(2 * pi * t) + 1) / 2;

  @override
  double transformInternal(double t) => (cos(2 * pi * t) + 1) / 2;
}
