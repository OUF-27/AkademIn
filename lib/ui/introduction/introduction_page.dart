import 'package:appjam_project/Widgets/custom_button_widget.dart';
import 'package:appjam_project/ui/Login/login_page.dart';
import 'package:appjam_project/ui/Register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "LOGO\n",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Get.width / 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: "App Name",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: Get.width / 16),
                            )
                          ]),
                    ),
                  ),
                ),
                CustomButton(
                  isBorder: false,
                  isFilled: true,
                  onTap: () {
                    Get.to(const LoginPage());
                  },
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 26, 43, 90),
                        fontWeight: FontWeight.w600,
                        fontSize: Get.width / 24),
                  )),
                ),
                CustomButton(
                  isBorder: true,
                  isFilled: false,
                  onTap: () {
                    Get.to(const RegisterPage());
                  },
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: Get.width / 24),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
