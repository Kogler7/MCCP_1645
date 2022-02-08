import 'package:flutter/material.dart';
import 'package:mccp_1645/config/export.dart';
class AccountFluro extends StatelessWidget {
  final bool login;
  final Function() press;
  const AccountFluro({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "还没有账号? " : "已经有账号? ",
          style: const TextStyle(color: KColor.darkButton),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " 注册" : " 登录",
            style: const TextStyle(
              color: KColor.darkButton,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
