import 'package:flutter/material.dart';
import 'package:mccp_1645/module/auth/signupbackground.dart';
import 'package:mccp_1645/module/auth/components/already_have_an_account_acheck.dart';
import 'package:mccp_1645/module/auth/login.dart';
import 'package:mccp_1645/module/auth/signup_or_divider.dart';
import 'package:mccp_1645/module/auth/signup_social_icon.dart';
import 'package:mccp_1645/module/auth/components/rounded_button.dart';
import 'package:mccp_1645/module/auth/components/rounded_input_field.dart';
import 'package:mccp_1645/module/auth/components/rounded_password_field.dart';
import 'package:mccp_1645/config/export.dart';
class singlePlayer extends StatefulWidget {
  const singlePlayer({Key? key}) : super(key: key);

  @override
  _singlePlayerState createState() => _singlePlayerState();
}
//signup
class _singlePlayerState extends State<singlePlayer> {


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
              Text(
                "注册",
                style: KTextStyle.titleBold,
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/auth/images/signup.png",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hintText: "电子邮件",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.03),
              GradientBtnWidget(
                width: 208,
                child: Text('注册',style:TextStyle(fontSize: 18.0, color:Colors.white,fontWeight: FontWeight.bold)),
                onTap: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return serverPlayer();
                      },
                    ),
                  );
                },
              ),
              //OrDivider(),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LineWidget(),
                  SocalIcon(
                    iconSrc: "assets/auth/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/auth/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/auth/icons/google-plus.svg",
                    press: () {},
                  ),
                  LineWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
