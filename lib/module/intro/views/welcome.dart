import 'package:flutter/material.dart';
import 'package:mccp_1645/module/intro/utils/step_target.dart';

import '../../../config/export.dart';
import '../utils/direct_animation.dart';
import '../utils/image_box.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController animationController;
  final int startIndex = 4;

  const WelcomeView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imageInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.downwardIn,
      speedFactor: 2.0,
    );
    final _titleInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.rightwardIn,
      speedFactor: 3.0,
    );
    final _textInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _imageInAnimation,
          child: const ImageBox(image: KIntroImage.welcome),
        ),
        SlideTransition(
          position: _titleInAnimation,
          child: const Padding(
            padding: EdgeInsets.only(top: 16),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  KIntroString.welcomeTitle,
                  style: KTextStyle.titleBold,
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _textInAnimation,
          child: const Padding(
            padding:
                EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 32),
            child: Text(
              KIntroString.welcomeText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
