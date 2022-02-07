import 'package:flutter/material.dart';
import 'package:mccp_1645/module/auth/login.dart';
import 'package:mccp_1645/module/auth/signup.dart';
import 'package:mccp_1645/module/auth/welcombackground.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/module/auth/components/rounded_button.dart';
class mutiPlayer extends StatefulWidget {
  const mutiPlayer({Key? key}) : super(key: key);
  @override
  _mutiPlayerState createState() => _mutiPlayerState();
}

class _mutiPlayerState extends State<mutiPlayer> {
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
                Text(
                  "一·六·四·五",
                  style: KTextStyle.titleBold,
                ),
                SizedBox(height: size.height * 0.05),
                Image.asset(
                  "assets/auth/images/welcom.png",
                  height: size.height * 0.45,
                ),
                SizedBox(height: size.height * 0.05),
                GradientBtnWidget(
                  width: 208,
                  child: Text('登录',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0, color:Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return serverPlayer();
                        },
                      ),
                    );},
                ),
                SizedBox(height: 16),
                RoundedButton(
                    text: "注册",
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

              ],
            ),
          ),
      ),
    );
  }
}
