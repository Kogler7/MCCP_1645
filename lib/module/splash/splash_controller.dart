import 'package:get/get.dart';
import 'package:mccp_1645/route/export.dart';
class SplashController extends GetxController{

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(Routes.intro);
    });
    super.onInit();
  }
  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
