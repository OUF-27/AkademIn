import 'package:appjam_project/controller/home_controller.dart';
import 'package:appjam_project/controller/register_conroller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
