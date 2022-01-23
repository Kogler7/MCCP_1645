import 'package:flutter/material.dart';
import 'package:mccp_1645/config/color.dart';
import 'package:mccp_1645/introduction/utils/step_target.dart';

import 'views/third_view.dart';
import 'utils/navigate_button.dart';
import 'views/forth_view.dart';
import 'views/second_view.dart';
import 'views/splash.dart';
import 'views/back_skip_view.dart';
import 'views/welcome.dart';

class AnimatedIntroductionScreen extends StatefulWidget {
  const AnimatedIntroductionScreen({Key? key}) : super(key: key);

  @override
  _AnimatedIntroductionScreenState createState() =>
      _AnimatedIntroductionScreenState();
}

class _AnimatedIntroductionScreenState extends State<AnimatedIntroductionScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )
      ..animateTo(0) //stepTargets[0]
      ..animateTo(stepTargets[1]);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backGround,
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(animationController: _controller!),
            SecondView(animationController: _controller!),
            ThirdView(animationController: _controller!),
            ForthView(animationController: _controller!),
            WelcomeView(animationController: _controller!),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _controller!,
            ),
            NavigateButton(
              animationController: _controller!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() => _controller?.animateTo(
        stepTargets[5],
        duration: const Duration(milliseconds: 1200),
      );

  void _onBackClick() {
    _controller?.animateTo(getLastStepTgt(_controller!.value));
  }

  void _onNextClick() {
    double target = getNextStepTgt(_controller!.value);
    if (target == 1.0) {
      _signUpClick();
    } else {
      _controller?.animateTo(target);
    }
  }

  void _signUpClick() {
    Navigator.pop(context);
  }
}
