import 'dart:math';
import 'package:flutter/material.dart';

///主要颜色常量
class KColor {
  static const Color darkBackGround = Color(0xff050B18); //默认背景颜色
  static const Color backGround = Color(0xffF7EBE1); //默认背景颜色
  static const Color darkButton = Color(0xff132137); //深色按钮颜色
}

///随机颜色集合，用于快速获取随机色
class KRndColor {
  static Color get newColor => rndColors[Random.secure().nextInt(10)];

  static const rndColors = [
    Color(0xAA795548),
    Color(0xAA673AB7),
    Color(0xAAE91E63),
    Color(0xAAF44336),
    Color(0xAAFFA000),
    Color(0xAAFFEE3B),
    Color(0xAACDDC39),
    Color(0xAA4CAF50),
    Color(0xAA009688),
    Color(0xAA00BCD4),
    Color(0xAA03A9F4),
  ];
}
