import 'package:appjam_project/controller/add_content_controller.dart';
import 'package:get/get.dart';

class AddContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddContentController>(() => AddContentController());
  }
}
