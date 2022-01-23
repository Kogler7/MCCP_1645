import 'package:flutter/material.dart';
import 'package:mccp_1645/config/index.dart';
import 'package:mccp_1645/introduction/utils/direct_animation.dart';
import 'package:mccp_1645/introduction/utils/step_target.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final _splashInAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: 0,
      direction: Directions.upwardIn,
    );
    final _splashOutAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: 1,
      direction: Directions.upwardOut,
    );
    return SlideTransition(
      position: _splashInAnimation,
      child: SlideTransition(
        position: _splashOutAnimation,
        child: SingleChildScrollView(
          child: Column(
            children: buildItems(context),
          ),
        ),
      ),
    );
  }

  List<Widget> buildItems(BuildContext context) => [
        const SizedBox(
          height: 100,
          width: double.infinity,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Image(
            image: KIntroImage.splash,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(
            KIntroString.splashTitle,
            style: KTextStyle.titleBold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 64, right: 64),
          child: Text(
            KIntroString.splashText,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 16),
          child: ButtonBegin(controller: widget.animationController),
        ),
      ];
}

class ButtonBegin extends StatelessWidget {
  const ButtonBegin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.animateTo(stepTargets[2]);
      },
      child: Container(
        height: 58,
        padding: const EdgeInsets.only(
          left: 56.0,
          right: 56.0,
          top: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(38.0),
          color: KColor.darkButton,
        ),
        child: const Text(
          "Let's begin",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
