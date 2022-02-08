import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/config/export.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuerySize;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image(
              image: KAuthImage.mainTop,
              width: size.width *0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image(
              image: KAuthImage.mainBottom,
              width: size.width *0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
