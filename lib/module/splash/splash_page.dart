import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/config/export.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            controller.obj,
            style: KTextStyle.titleBold,
          ),
        ),
      ),
    );
  }
}
