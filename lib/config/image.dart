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
  static const AssetImage splash = AssetImage('assets/introduction/splash.png');
  static const AssetImage second = AssetImage('assets/introduction/second.png');
  static const AssetImage third = AssetImage('assets/introduction/third.png');
  static const AssetImage forth = AssetImage('assets/introduction/forth.png');
  static const AssetImage welcome = AssetImage('assets/introduction/welcome.png');
}
