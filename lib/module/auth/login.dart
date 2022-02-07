import 'package:flutter/material.dart';
import 'package:mccp_1645/module/auth/loginbackground.dart';
import 'package:mccp_1645/module/auth/signup.dart';
import 'package:mccp_1645/module/auth/components/already_have_an_account_acheck.dart';
import 'package:mccp_1645/module/auth/components/rounded_button.dart';
import 'package:mccp_1645/module/auth/components/rounded_input_field.dart';
import 'package:mccp_1645/module/auth/components/rounded_password_field.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/module/auth/signup_social_icon.dart';
import 'signup_or_divider.dart';
class serverPlayer extends StatefulWidget {
  const serverPlayer({Key? key}) : super(key: key);

  @override
  _serverPlayerState createState() => _serverPlayerState();
}

class _serverPlayerState extends State<serverPlayer> {

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
              Text(
                "登录",
                style:KTextStyle.titleBold
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.01),
              Image.asset(
                "assets/auth/images/login.png",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
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
                child: Text('登录',style:TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.white)),
                onTap: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return singlePlayer();
                      },
                    ),
                  );
                },
              ),
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
