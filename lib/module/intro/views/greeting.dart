import 'package:flutter/material.dart';
import 'package:mccp_1645/config/export.dart';
import 'package:mccp_1645/module/intro/utils/direct_animation.dart';
import 'package:mccp_1645/module/intro/utils/step_target.dart';

class GreetingView extends StatefulWidget {
  final AnimationController animationController;

  const GreetingView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _GreetingViewState createState() => _GreetingViewState();
}

class _GreetingViewState extends State<GreetingView> {
  final int startIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _titleInAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex,
      direction: Directions.upwardIn,
      speedFactor: 1.0,
    );
    final _titleOutAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex + 1,
      direction: Directions.leftwardOut,
    );
    final _textInAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex,
      direction: Directions.upwardIn,
      speedFactor: 2.0,
    );
    final _textOutAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex + 1,
      direction: Directions.rightwardOut,
      speedFactor: 2.0,
    );
    final _imageInAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex,
      direction: Directions.downwardIn,
      speedFactor: 4.0,
    );
    final _imageOutAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex + 1,
      direction: Directions.upwardOut,
      speedFactor: 4.0,
    );
    final _buttonInAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex,
      direction: Directions.upwardIn,
      speedFactor: 4.0,
    );
    final _buttonOutAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex + 1,
      direction: Directions.downwardOut,
      speedFactor: 3.0,
    );
    final _splashInAnimation = buildOffsetTweenStepAnimation(
      controller: widget.animationController,
      startIndex: startIndex,
      direction: Directions.upwardIn,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          SlideTransition(
            position: _imageInAnimation,
            child: SlideTransition(
              position: _imageOutAnimation,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Image(
                    image: KIntroImage.greeting,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SlideTransition(
            position: _splashInAnimation,
            child: Column(
              children: [
                SlideTransition(
                  position: _titleInAnimation,
                  child: SlideTransition(
                    position: _titleOutAnimation,
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          KIntroString.greetingTitle,
                          style: KTextStyle.titleBold,
                        ),
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _textInAnimation,
                  child: SlideTransition(
                    position: _textOutAnimation,
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 64, right: 64, top: 16, bottom: 16),
                      child: Text(
                        KIntroString.greetingText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _buttonInAnimation,
                  child: SlideTransition(
                    position: _buttonOutAnimation,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 32,
                        bottom: MediaQuery.of(context).padding.bottom + 16,
                      ),
                      child: ButtonBegin(controller: widget.animationController),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
          KIntroString.letUsBegin,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
