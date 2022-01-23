import 'package:flutter/material.dart';

import '../../config/index.dart';
import '../utils/direct_animation.dart';
import '../utils/image_box.dart';

class ForthView extends StatelessWidget {
  final AnimationController animationController;
  final int startIndex = 3;

  const ForthView({Key? key, required this.animationController})
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
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _textOutAnimation,
            child: SlideTransition(
              position: _textInAnimation,
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    KIntroString.forthTitle,
                    style: KTextStyle.titleBold,
                  ),
                ),
              ),
            ),
          ),
          SlideTransition(
            position: _titleOutAnimation,
            child: SlideTransition(
              position: _titleInAnimation,
              child: const Padding(
                padding: EdgeInsets.only(
                    left: 64, right: 64, top: 16),
                child: Text(
                  KIntroString.forthText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SlideTransition(
            position: _imageOutAnimation,
            child: SlideTransition(
              position: _imageInAnimation,
              child: const ImageBox(image:KIntroImage.forth),
            ),
          ),
        ],
      ),
    );
  }
}
