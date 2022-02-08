import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mccp_1645/config/color.dart';
import 'package:mccp_1645/config/icon.dart';

class LogInOtherChoice extends StatelessWidget {
  const LogInOtherChoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LineWidget(),
        SocalIcon(
          iconSrc: KAuthSvgAssets.facebook,
          press: () {},
        ),
        SocalIcon(
          iconSrc: KAuthSvgAssets.twitter,
          press: () {},
        ),
        SocalIcon(
          iconSrc: KAuthSvgAssets.googlePlus,
          press: () {},
        ),
        const LineWidget(),
      ],
    );
  }
}

class LineWidget extends StatelessWidget {
  const LineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 80,
      child: Divider(color: KColor.darkBackGround),
    );
  }
}

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function() press;

  const SocalIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SvgPicture.asset(
          iconSrc,
          height: 16,
          width: 16,
        ),
      ),
    );
  }
}