import 'dart:math';

import 'package:appjam_project/models/user_model.dart' as model;
import 'package:appjam_project/widgets/bottom_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  final username = TextEditingController().obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  void dispose() {
    username.value.dispose();
    email.value.dispose();
    password.value.dispose();
    super.dispose();
  }

  //sign up
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String response = "Some error ocured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        //regiter user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid.toString());

        // add user to database
        model.User user = model.User(
          username: username,
          email: email,
          uid: cred.user!.uid,
          followers: [],
          following: [],
          imageUrl: "",
        );

        await _fireStore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        print(user.toJson());

        // DocumentSnapshot snap = await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(FirebaseAuth.instance.currentUser!.uid)
        //     .get();

        // GetStorage().write("user", snap.data());

        var randomIndex = Random().nextInt(10);
        GetStorage().write("themeIndex", randomIndex);

        response = 'success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        response = "The email is badly formatted.";
      } else if (e.code == "weak-password") {
        response = "Password should be at least 6 characters";
      } else if (e.code == "email-already-in-use") {
        response = "User already exist";
      }
      print(e.code);
    } catch (e) {
      //response = e.toString();
    }

    return response;
  }

  void register() async {
    isLoading.value = true;

    String response = await signUpUser(
        email: email.value.text,
        password: password.value.text,
        username: username.value.text);

    isLoading.value = false;
    if (response != "success") {
      Get.snackbar("Error", response);
    } else {
      Get.snackbar("Success", response);
    }
  }
}
