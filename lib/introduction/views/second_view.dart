import 'package:flutter/material.dart';
import 'package:mccp_1645/config/index.dart';
import 'package:mccp_1645/introduction/utils/direct_animation.dart';

class SecondView extends StatelessWidget {
  final AnimationController animationController;
  final int startIndex = 1;

  const SecondView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _allInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.upwardIn,
    );
    final _titleInAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex,
      direction: Directions.upwardIn,
      speedFactor: 1.0,
    );
    final _titleOutAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
    );
    final _textOutAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
      speedFactor: 2.0,
    );
    final _imageOutAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
      speedFactor: 4.0,
    );

    return SlideTransition(
      position: _allInAnimation,
      child: SlideTransition(
        position: _titleOutAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _titleInAnimation,
                child: const Text(
                  KIntroString.secondTitle,
                  style: KTextStyle.titleBold,
                ),
              ),
              SlideTransition(
                position: _textOutAnimation,
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    KIntroString.secondText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: _imageOutAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: const Image(
                    image: KIntroImage.second,
                    fit: BoxFit.contain,
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
