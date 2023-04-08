import 'dart:math';
import 'package:appjam_project/models/user_model.dart' as model;
import 'package:appjam_project/widgets/bottom_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  void dispose() {
    email.value.dispose();
    password.value.dispose();
    super.dispose();
  }

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _fireStore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //sign up
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String response = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //regiter user
        UserCredential cred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        response = 'success';

        // DocumentSnapshot snap = await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(FirebaseAuth.instance.currentUser!.uid)
        //     .get();

        // GetStorage().write("user", snap.data());
      } else {
        response = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        response = "User not found";
      } else if (e.code == "wrong-password") {
        response = "Password is wrong";
      }
    } catch (e) {
      response = e.toString();
    }

    return response;
  }

  void login() async {
    isLoading.value = true;

    String response =
        await loginUser(email: email.value.text, password: password.value.text);

    if (response == "success") {
      Get.to(BottomBarWidget());
    } else {
      Get.snackbar("Error", response);
    }

    isLoading.value = false;
  }
}
