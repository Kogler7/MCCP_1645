//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mccp_1645/config/export.dart';
///圆形按钮
class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color=Colors.white,
    this.textColor = KColor.darkBackGround,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 208,
      height: 48,
      decoration: BoxDecoration(
        boxShadow: kBtnShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: newElevatedButton(),
      ),
    );
  }
  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          //padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),),
    );
  }
}
/// 渐变按钮组件
class GradientBtnWidget extends StatelessWidget {
  const GradientBtnWidget({
    Key key,
    this.width,
    this.child,
    this.onTap,
  }) : super(key: key);
  final double width;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          gradient: kBtnLinearGradient,
          boxShadow: kBtnShadow,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}