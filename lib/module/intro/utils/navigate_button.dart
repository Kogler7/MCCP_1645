import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mccp_1645/config/color.dart';
import 'package:mccp_1645/module/intro/utils/step_target.dart';

import '../../../config/string/intro.dart';
import 'direct_animation.dart';

class NavigateButton extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;

  const NavigateButton(
      {Key? key, required this.animationController, required this.onNextClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _topMoveAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: 1,
      direction: Directions.upwardIn,
      speedFactor: 5.0,
    );
    final _signUpMoveAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        stepTargets[4],
        stepTargets[5],
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _loginTextMoveAnimation = buildOffsetTweenStepAnimation(
      controller: animationController,
      startIndex: 4,
      direction: Directions.upwardIn,
      speedFactor: 5.0,
    );

    return Padding(
      padding:
          EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => AnimatedOpacity(
                opacity:
                    isBetweenSteps(animationController.value, 2, 4) ? 1 : 0,
                duration: const Duration(milliseconds: 480),
                child: _pageView(),
              ),
            ),
          ),
          buildSignUpSlideTransition(_topMoveAnimation, _signUpMoveAnimation),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: buildLoginSlideTransition(_loginTextMoveAnimation),
          ),
        ],
      ),
    );
  }

  SlideTransition buildLoginSlideTransition(
      Animation<Offset> _loginTextMoveAnimation) {
    return SlideTransition(
      position: _loginTextMoveAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            KIntroString.alreadyHaveAccount,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            KIntroString.logIn,
            style: TextStyle(
              color: KColor.darkButton,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  SlideTransition buildSignUpSlideTransition(
      Animation<Offset> _topMoveAnimation,
      Animation<double> _signUpMoveAnimation) {
    return SlideTransition(
      position: _topMoveAnimation,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            height: 58,
            width: 58 + (200 * _signUpMoveAnimation.value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: KColor.darkButton,
            ),
            child: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 480),
              reverse: _signUpMoveAnimation.value < getMidStepTarget(4, 5),
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  fillColor: Colors.transparent,
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.vertical,
                );
              },
              child: _signUpMoveAnimation.value > getMidStepTarget(4, 5)
                  ? InkWell(
                      key: const ValueKey('Sign Up button'),
                      onTap: onNextClick,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              KIntroString.signUp,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(Icons.arrow_forward_rounded,
                                color: Colors.white),
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      key: const ValueKey('next button'),
                      onTap: onNextClick,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.white),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pageView() {
    int _selectedIndex = 0;

    if (animationController.value >= getMidStepTarget(4, 5)) {
      _selectedIndex = 3;
    } else if (animationController.value >= getMidStepTarget(3, 4)) {
      _selectedIndex = 2;
    } else if (animationController.value >= getMidStepTarget(2, 3)) {
      _selectedIndex = 1;
    } else if (animationController.value >= getMidStepTarget(1, 2)) {
      _selectedIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: _selectedIndex == i
                      ? const Color(0xff132137)
                      : const Color(0xffE3E4E4),
                ),
                width: 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }
}
