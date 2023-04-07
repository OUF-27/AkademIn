import 'package:appjam_project/controller/home_controller.dart';
import 'package:appjam_project/controller/introduction_controller.dart';
import 'package:get/get.dart';

class IntroductionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroductionController>(() => IntroductionController());
  }
}
