import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/module/auth/login.dart';
import 'package:mccp_1645/module/auth/signup.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/shared/widget/button/rounded_button.dart';

import 'components/background.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KColor.backGround,
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "一·六·四·五",
                style: KTextStyle.titleBold,
              ),
              SizedBox(height: size.height * 0.05),
              Image(
                image: KAuthImage.welcome,
                width: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                width: 208,
                title: '登录',
                style: KTextStyle.authButtonWhite,
                gradient: KGradient.authButton,
                shadows: KBoxShadow.authButton,
                onTap: () {
                  Get.off(const LoginPage());
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                width: 208,
                title: '注册',
                primary: Colors.white,
                style: KTextStyle.authButtonDark,
                shadows: KBoxShadow.authButton,
                onTap: () {
                  Get.off(const SignUpPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
