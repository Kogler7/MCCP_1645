import 'package:flutter/material.dart';

import '../../config/index.dart';
import '../utils/direct_animation.dart';

class ForthView extends StatelessWidget {
  final AnimationController animationController;
  final int startIndex = 3;

  const ForthView({Key? key, required this.animationController})
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
    final _moodFirstHalfAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.leftwardIn,
      speedFactor: 2.0,
    );
    final _moodSecondHalfAnimation = buildOffsetTweenStepAnimation(
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
              const Text(
                KIntroString.forthTitle,
                style: KTextStyle.titleBold,
              ),
              SlideTransition(
                position: _moodFirstHalfAnimation,
                child: SlideTransition(
                  position: _moodSecondHalfAnimation,
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 64, right: 64, top: 16, bottom: 16),
                    child: Text(
                      KIntroString.forthText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: _imageFirstHalfAnimation,
                child: SlideTransition(
                  position: _imageSecondHalfAnimation,
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 350, maxHeight: 250),
                    child: const Image(
                      image: KIntroImage.forth,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
