import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/global.dart';
import 'package:mccp_1645/route/export.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _obj = ''.obs;
  AnimationController? controller;

  @override
  void onInit() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    )
      ..forward()
      ..addListener(() {
        obj = '正加载${(100 * controller!.value).toStringAsFixed(2)}%';
      })
      ..addStatusListener((status) {
        if (GlobalConfig.showTestPage) {
          Get.offAllNamed(Routes.test);
          return;
        } //检查是否处于测试模式，便于开发
        if (status == AnimationStatus.completed) Get.offAllNamed(Routes.intro);
      });
    super.onInit();
  }

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
}
