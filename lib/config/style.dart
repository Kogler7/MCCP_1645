import 'package:flutter/material.dart';
import 'package:mccp_1645/config/color.dart';
// 按钮投影
const List<BoxShadow> kBtnShadow = [
  BoxShadow(
    color: kBtnShadowColor,
    offset: Offset(0, 8),
    blurRadius: 20,
  )
];
///内置文字样式标准
class KTextStyle {
  static const titleBold =
      TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold);
  static const text = TextStyle(fontSize: 22.0);
}

