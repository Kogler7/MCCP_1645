import 'package:flutter/material.dart';

///图片常量
class KUtilImage {
  static const AssetImage expect = AssetImage('assets/images/expect.png');
}
///返回作者头像
class AuthAvatar {
  static AssetImage of(String name) => AssetImage('assets/avatars/$name.jpg');
}
///Introduction
class KIntroImage{
  static const AssetImage greeting = AssetImage('assets/intro/greeting.png');
  static const AssetImage second = AssetImage('assets/intro/second.png');
  static const AssetImage third = AssetImage('assets/intro/third.png');
  static const AssetImage forth = AssetImage('assets/intro/forth.png');
  static const AssetImage welcome = AssetImage('assets/intro/welcome.png');
}
