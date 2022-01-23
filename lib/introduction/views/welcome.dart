import 'package:flutter/material.dart';

import '../../config/index.dart';
import '../utils/direct_animation.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController animationController;
  final int startIndex = 4;

  const WelcomeView({Key? key, required this.animationController})
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
      startIndex: startIndex + 1, //有什么用？+1
      direction: Directions.leftwardOut,
    );
    final _welcomeFirstHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
      speedFactor: 2.0,
    );
    final _welcomeImageAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
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
                position: _welcomeImageAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 350),
                  child: const Image(
                    image: KIntroImage.welcome,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SlideTransition(
                position: _welcomeFirstHalfAnimation,
                child: const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    KIntroString.welcomeTitle,
                    style: KTextStyle.titleBold,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                child: Text(
                  KIntroString.welcomeText,
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
