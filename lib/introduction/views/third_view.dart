import 'package:flutter/material.dart';
import 'package:mccp_1645/introduction/utils/direct_animation.dart';

import '../../config/index.dart';

class ThirdView extends StatelessWidget {
  final AnimationController animationController;
  final int startIndex = 2;

  const ThirdView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
    );
    final _secondHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
    );
    final _relaxFirstHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
      speedFactor: 2.0,
    );
    final _relaxSecondHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
      speedFactor: 2.0,
    );

    final _imageFirstHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
      speedFactor: 4.0,
    );
    final _imageSecondHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
      speedFactor: 4.0,
    );

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _imageFirstHalfAnimation,
                child: SlideTransition(
                  position: _imageSecondHalfAnimation,
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 350, maxHeight: 250),
                    child: const Image(
                      image: KIntroImage.third,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: _relaxFirstHalfAnimation,
                child: SlideTransition(
                  position: _relaxSecondHalfAnimation,
                  child: const Text(
                    KIntroString.thirdTitle,
                    style: KTextStyle.titleBold,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 64, right: 64, bottom: 16, top: 16),
                child: Text(
                  KIntroString.thirdText,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
