import 'package:flutter/material.dart';
import 'package:mccp_1645/module/intro/utils/direct_animation.dart';

import '../../../config/export.dart';
import '../utils/image_box.dart';

class ThirdView extends StatelessWidget {
  final AnimationController animationController;
  final int startIndex = 2;

  const ThirdView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
    );
    final _textOutAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
    );
    final _titleInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
      speedFactor: 2.0,
    );
    final _titleOutAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
      speedFactor: 2.0,
    );

    final _imageInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
      speedFactor: 4.0,
    );
    final _imageOutAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
      speedFactor: 4.0,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _imageInAnimation,
            child: SlideTransition(
              position: _imageOutAnimation,
              child: const ImageBox(image: KIntroImage.third),
            ),
          ),
          SlideTransition(
            position: _titleInAnimation,
            child: SlideTransition(
              position: _titleOutAnimation,
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    KIntroString.thirdTitle,
                    style: KTextStyle.titleBold,
                  ),
                ),
              ),
            ),
          ),
          SlideTransition(
            position: _textInAnimation,
            child: SlideTransition(
              position: _textOutAnimation,
              child: const Padding(
                padding:
                    EdgeInsets.only(left: 64, right: 64, bottom: 16, top: 16),
                child: Text(
                  KIntroString.thirdText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
