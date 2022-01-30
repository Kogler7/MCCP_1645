import 'package:get/get.dart';
import 'package:mccp_1645/module/splash/splash_controller.dart';


class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}