import 'package:camera/camera.dart';
import 'package:get/get.dart';

class AddContentController extends GetxController {
  List<CameraDescription> cameras = [];

  // cropImage(BuildContext context, File file) async {
  //   CroppedFile? croppedFile;
  //   if (file != null) {
  //     croppedFile = await ImageCropper().cropImage(
  //       sourcePath: file.path,
  //       compressFormat: ImageCompressFormat.jpg,
  //       compressQuality: 100,
  //       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'Cropping...',
  //           toolbarWidgetColor: Colors.white,
  //           lockAspectRatio: true,
  //           hideBottomControls: true,
  //         ),
  //       ],
  //     );
  //   }
  //   if (croppedFile != null) {
  //     return croppedFile;
  //   } else {
  //     return null;
  //   }
  // }
}
