import 'package:flutter/material.dart';
import 'package:mccp_1645/module/auth/components/log_in_others.dart';
import 'package:mccp_1645/module/auth/signup.dart';
import 'package:mccp_1645/module/auth/components/account_fluro.dart';
import 'package:mccp_1645/module/auth/components/input_field.dart';
import 'package:mccp_1645/module/auth/components/password_field.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/shared/widget/button/rounded_button.dart';

import 'components/background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              SizedBox(height: size.height * 0.05),
              const Text("登录", style: KTextStyle.titleBold
                  // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
              SizedBox(height: size.height * 0.01),
              Image(
                image: KAuthImage.signUp,
                width: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "电子邮件",
                onChanged: (value) {},
              ),
              PasswordField(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                width: 208,
                title: '登录',
                style: KTextStyle.authButtonWhite,
                gradient: KGradient.authButton,
                shadows: KBoxShadow.authButton,
                onTap: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AccountFluro(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpPage();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.05),
              const LogInOtherChoice(),
            ],
          ),
        ),
      ),
    );
  }
}
