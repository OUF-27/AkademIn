import 'dart:io';

import 'package:appjam_project/controller/add_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class DisplayPictureScreen extends StatefulWidget {
  final File imageFile;
  //late CroppedFile? _croppedFile;

  DisplayPictureScreen({super.key, required this.imageFile});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final controller = Get.put(AddContentController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //cropImage();
  }

  // cropImage() async {
  //   if (widget._croppedFile == null) {
  //     widget._croppedFile =
  //         await controller.cropImage(context, widget.imageFile);
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: Get.width,
              height: Get.height,
              child: Image.file(
                File(widget.imageFile.path),
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}
