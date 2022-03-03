import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/module/auth/components/account_fluro.dart';
import 'package:mccp_1645/module/auth/login.dart';
import 'package:mccp_1645/module/auth/components/input_field.dart';
import 'package:mccp_1645/module/auth/components/password_field.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/route/export.dart';
import 'package:mccp_1645/shared/widget/button/rounded_button.dart';

import 'components/background.dart';
import 'components/log_in_others.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

//signup
class _SignUpPageState extends State<SignUpPage> {
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
              SizedBox(height: size.height * 0.07),
              const Text(
                "注册",
                style: KTextStyle.titleBold,
              ),
              SizedBox(height: size.height * 0.03),
              Image(
                image: KAuthImage.signUp,
                width: size.height * 0.35,
              ),
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
                title: '注册',
                primary: Colors.white,
                style: KTextStyle.authButtonDark,
                shadows: KBoxShadow.authButton,
                onTap: () {
                  Get.offAllNamed(Routes.home);
                },
              ),
              SizedBox(height: size.height * 0.03),
              AccountFluro(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
              ),
              //OrDivider(),
              SizedBox(height: size.height * 0.05),
              const LogInOtherChoice()
            ],
          ),
        ),
      ),
    );
  }
}
