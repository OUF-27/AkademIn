import 'dart:io';

import 'package:appjam_project/controller/add_content_controller.dart';
import 'package:appjam_project/ui/add%20content/display_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContentPage extends StatefulWidget {
  const AddContentPage({super.key});

  @override
  State<AddContentPage> createState() => _AddContentPageState();
}

class _AddContentPageState extends State<AddContentPage>
    with TickerProviderStateMixin {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  late Future<void> _initializeControllerFuture;
  final controller = Get.put(AddContentController());

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    setState(() {
      _controller = CameraController(
        _cameras[0],
        ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller)),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 15,
            child: GestureDetector(
              onTap: () async {
                await _initializeControllerFuture;
                await _controller.takePicture().then(
                  (XFile? image) {
                    if (mounted) {
                      setState(() {
                        Get.to(
                            DisplayPictureScreen(imageFile: File(image!.path)));
                      });
                    }
                  },
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Icon(
                    Icons.circle,
                    color: Colors.white38,
                    size: 80,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 65,
                  ),
                  Icon(
                    Icons.stop_rounded,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
