import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/module/intro/utils/step_target.dart';

import '../../route/export.dart';
import 'views/third_view.dart';
import 'utils/navigate_button.dart';
import 'views/forth_view.dart';
import 'views/second_view.dart';
import 'views/greeting.dart';
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
  final _streamController = StreamController();

  int poemIndex = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8), //动画总时长
    )
      ..animateTo(0) //stepTargets[0]
      ..animateTo(stepTargets[1])
      ..addListener(() {
        _streamController.sink.add(_controller?.value);
      });
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
            GreetingView(animationController: _controller!),
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
            Positioned(
              bottom: 24,
              left: 64,
              right: 64,
              child: StreamBuilder(
                  stream: _streamController.stream,
                  initialData: 0.0,
                  builder: (ctx, snap) {
                    double op = 0;
                    double data = snap.data as double? ?? 0.0;
                    double base = getLastStepTgt(data);
                    double ratio = (data - base - 0.16) / 0.16;
                    op = min(1 - sin(ratio * pi), 1.0);
                    if (data <= getMidStepTarget(1, 2)) {
                      op = 0;
                    }
                    if (isBetweenMidSteps(data, 2, 3)) {
                      poemIndex = 0;
                    } else if (isBetweenMidSteps(data, 3, 4)) {
                      poemIndex = 1;
                    } else if (isBetweenMidSteps(data, 4, 5)) {
                      poemIndex = 2;
                    } else {
                      poemIndex = 3;
                    }
                    return Opacity(
                      opacity: op,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            KIntroString.poems[poemIndex * 2],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Text(
                                KIntroString.poems[poemIndex * 2 + 1],
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _controller?.animateTo(
      stepTargets[5],
      duration: const Duration(milliseconds: 1200),
    );
  }

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
    Get.offNamed(Routes.home);
  }
}
