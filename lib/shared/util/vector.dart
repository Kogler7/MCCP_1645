import 'dart:math';

import 'package:flutter/material.dart';

class Vector {
  double x, y;

  Vector(this.x, this.y);

  static Vector zero = Vector(0.0, 0.0);

  static Vector of(Offset offset) => Vector(offset.dx, offset.dy);

  Offset get offset => Offset(x, y);

  Vector get normalVector => this / distance;

  double get distance => sqrt(x * x + y * y);

  double get distanceSquared => x * x + y * y;

  double get direction => atan2(y, x);

  Vector operator -() => Vector(-x, -y);

  Vector operator -(Vector other) => Vector(x - other.x, y - other.y);

  Vector operator +(Vector other) => Vector(x + other.x, y + other.y);

  Vector operator *(double operand) => Vector(x * operand, y * operand);

  Vector operator /(double operand) => Vector(x / operand, y / operand);

  Vector operator ~/(double operand) =>
      Vector((x ~/ operand).toDouble(), (y ~/ operand).toDouble());

  Vector operator %(double operand) => Vector(x % operand, y % operand);

  @override
  bool operator ==(Object other) {
    return other is Vector && other.x == x && other.y == y;
  }

  @override
  int get hashCode => hashValues(x, y);

  @override
  String toString() =>
      'Vector(${x.toStringAsFixed(1)}, ${y.toStringAsFixed(1)})';
}
