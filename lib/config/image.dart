import 'package:flutter/material.dart';

///图片常量
class KImage {
  static const AssetImage expect = AssetImage('assets/images/expect.png');
}
///返回作者头像
class AuthAvatar {
  static AssetImage of(String name) => AssetImage('assets/avatars/$name.jpg');
}
