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
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),

            Obx(
                  () => Text(
                controller.obj,
                style: KTextStyle.titleBold,
              ),
            ),
          ],
        )
      ),
    );
  }
}
