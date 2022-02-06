import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/module/intro/utils/step_value.dart';

import '../../route/export.dart';
import 'views/third_view.dart';
import 'widgets/navigate_button.dart';
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
  AnimationController? _controller; //动画控制器
  final _streamController = StreamController(); //诗句透明度局部刷新流控制器

  int poemIndex = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8), //动画总时长
    )
      ..animateTo(Steps.values[1])
      ..addListener(() {
        //对于动画的每一帧，将帧值通过流传递给诗句透明度控制组件
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
            buildPoemsDisplay(),
          ],
        ),
      ),
    );
  }

  Positioned buildPoemsDisplay() {
    return Positioned(
      bottom: 24,
      left: 64,
      right: 64,
      child: StreamBuilder(
          stream: _streamController.stream,
          initialData: 0.0,
          builder: (ctx, snap) {
            double data = snap.data as double? ?? 0.0;
            double opacity = calculateOpacity(data);
            if (Steps.btwMidSteps(data, 2, 3)) {
              poemIndex = 0;
            } else if (Steps.btwMidSteps(data, 3, 4)) {
              poemIndex = 1;
            } else if (Steps.btwMidSteps(data, 4, 5)) {
              poemIndex = 2;
            } else {
              poemIndex = 3;
            }
            return Opacity(
              opacity: opacity,
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
    );
  }

  double calculateOpacity(double data) {
    if (data <= Steps.midValueByStep(1, 2)) {
      return 0;
    } //1.5阶段之前完全隐藏
    double ratio = Steps.ratioBtwSteps(data);
    return min(1 - sin(ratio * pi), 1.0);
  }

  void _onSkipClick() {
    _controller?.animateTo(
      Steps.values[5],
      duration: const Duration(milliseconds: 1200),
    );
  }

  void _onBackClick() {
    _controller?.animateTo(Steps.lastTargetValue(_controller!.value));
  }

  void _onNextClick() {
    double target = Steps.nextTargetValue(_controller!.value);
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
