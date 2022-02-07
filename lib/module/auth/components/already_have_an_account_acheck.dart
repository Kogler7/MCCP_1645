//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mccp_1645/config/export.dart';
class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "还没有账号? " : "已经有账号? ",
          style: TextStyle(color: KColor.darkButton),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " 注册" : " 登录",
            style: TextStyle(
              color: KColor.darkButton,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
