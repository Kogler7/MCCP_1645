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
class KIntroImage {
  static const AssetImage greeting = AssetImage('assets/intro/greeting.png');
  static const AssetImage second = AssetImage('assets/intro/second.png');
  static const AssetImage third = AssetImage('assets/intro/third.png');
  static const AssetImage forth = AssetImage('assets/intro/forth.png');
  static const AssetImage welcome = AssetImage('assets/intro/welcome.png');
}

class KAuthImage {
  static const AssetImage welcome =
      AssetImage("assets/auth/images/welcome.png");
  static const AssetImage mainTop =
      AssetImage("assets/auth/images/main_top.png");
  static const AssetImage mainBottom =
      AssetImage("assets/auth/images/main_bottom.png");
  static const AssetImage signUp = AssetImage("assets/auth/images/signup.png");
  static const AssetImage signUpTop =
      AssetImage("assets/auth/images/signup_top.png");
  static const AssetImage login = AssetImage("assets/auth/images/login.png");
  static const AssetImage loginBottom =
      AssetImage("assets/auth/images/login_bottom.png");
}
