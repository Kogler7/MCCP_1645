import 'package:flutter/material.dart';
import 'package:mccp_1645/config/index.dart';

import '../utils/direct_animation.dart';

class TopBackSkipView extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onBackClick;
  final VoidCallback onSkipClick;

  const TopBackSkipView({
    Key? key,
    required this.onBackClick,
    required this.onSkipClick,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: 1,
      direction: Directions.downwardIn,
    );
    final _skipAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: 4,
      direction: Directions.rightwardOut,
      speedFactor: 2.0,
    );

    return SlideTransition(
      position: _animation,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: 58,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SlideTransition(
                //   position: _backAnimation,
                //   child:
                IconButton(
                  onPressed: onBackClick,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  //   ),
                ),
                SlideTransition(
                  position: _skipAnimation,
                  child: IconButton(
                    onPressed: onSkipClick,
                    icon: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
