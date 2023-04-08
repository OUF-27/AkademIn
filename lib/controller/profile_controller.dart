import 'package:appjam_project/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class ProfileController extends GetxController {
  final List<ProfileTheme> profileThemeList = <ProfileTheme>[
    ProfileTheme(
        color: blueColor.withOpacity(0.3),
        capture: "assets/images/capture(1).jpg"),
    ProfileTheme(
        color: blueColor.withOpacity(0.3),
        capture: "assets/images/capture(2).jpg"),
    ProfileTheme(
        color: blueColor.withOpacity(0.3),
        capture: "assets/images/capture(3).jpg"),
    ProfileTheme(
        color: greenColor.withOpacity(0.3),
        capture: "assets/images/capture(4).jpg"),
    ProfileTheme(
        color: redColor.withOpacity(0.3),
        capture: "assets/images/capture(5).jpg"),
    ProfileTheme(
        color: greenColor.withOpacity(0.3),
        capture: "assets/images/capture(6).jpg"),
    ProfileTheme(
        color: yellowColor.withOpacity(0.3),
        capture: "assets/images/capture(7).jpg"),
    ProfileTheme(
        color: blueColor.withOpacity(0.3),
        capture: "assets/images/capture(8).jpg"),
    ProfileTheme(
        color: greenColor.withOpacity(0.3),
        capture: "assets/images/capture(9).jpg"),
    ProfileTheme(
        color: blueColor.withOpacity(0.3),
        capture: "assets/images/capture(10).jpg"),
  ].obs;

  final List<Color> colorList = <Color>[
    yellowColor.withOpacity(0.3),
    greenColor.withOpacity(0.3),
    blueColor.withOpacity(0.3),
    redColor.withOpacity(0.3)
  ].obs;
}
