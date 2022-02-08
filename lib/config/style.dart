import 'package:flutter/material.dart';
import 'package:mccp_1645/config/color.dart';

class KBoxShadow {
  static const List<BoxShadow> authButton = [
    BoxShadow(
      color: KColor.btnShadow,
      offset: Offset(0, 8),
      blurRadius: 20,
    )
  ];
}

///内置文字样式标准
class KTextStyle {
  static const titleBold =
      TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold);
  static const text = TextStyle(fontSize: 22.0);
  static const authButtonWhite = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: Colors.white,
  );
  static const authButtonDark = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: Colors.black,
  );
}
