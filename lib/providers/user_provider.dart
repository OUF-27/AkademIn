import 'package:appjam_project/controller/login_controller.dart';
import 'package:appjam_project/controller/register_conroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final controller = Get.put(LoginController());

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await controller.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
