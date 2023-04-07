import 'package:appjam_project/controller/myapp_controller.dart';
import 'package:get/get.dart';

class MyappBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyappController>(() => MyappController());
  }
}
