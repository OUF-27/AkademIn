import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        style:
            const TextStyle(color: darkBlueColor, fontWeight: FontWeight.w600),
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            fillColor: Colors.white30,
            border: InputBorder.none,
            filled: true,
            hintText: hintText,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
                fontSize: Get.width / 27,
                color: darkBlueColor,
                fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
