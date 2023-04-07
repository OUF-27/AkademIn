import 'package:appjam_project/ui/home/home_page.dart';
import 'package:appjam_project/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_text_field_widget.dart';
import '../../constants/colors.dart';
import '../Introduction/introduction_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.offAll(IntroductionPage());
                          },
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          )),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "Create Account,\n",
                                    style: TextStyle(
                                        color: darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Get.width / 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "to get started now!",
                                        style: TextStyle(
                                            color: darkBlueColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: Get.width / 16),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          const CustomTextField(
                            hintText: "E-mail",
                          ),
                          CustomTextField(
                            hintText: "Password",
                            obscureText: true,
                            suffixIcon: Container(
                              margin: const EdgeInsets.all(15),
                              child: Image.asset(
                                "assets/icons/hide.png",
                                width: 5,
                                color: darkBlueColor,
                              ),
                            ),
                          ),
                          CustomTextField(
                            hintText: "Confirm Password",
                            obscureText: true,
                            suffixIcon: Container(
                              margin: const EdgeInsets.all(15),
                              child: Image.asset(
                                "assets/icons/hide.png",
                                width: 5,
                                color: darkBlueColor,
                              ),
                            ),
                          ),
                          CustomButton(
                            isBorder: false,
                            isFilled: true,
                            onTap: () {
                              Get.to(const HomePage());
                            },
                            child: Center(
                                child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 26, 43, 90),
                                  fontWeight: FontWeight.w600,
                                  fontSize: Get.width / 24),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: darkBlueColor,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Or login with",
                                    style: TextStyle(
                                        color: darkBlueColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: darkBlueColor,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomButton(
                                isBorder: false,
                                isFilled: true,
                                onTap: () {},
                                child: Image.asset(
                                  "assets/icons/google.png",
                                  width: Get.width * 0.06,
                                  height: Get.width * 0.06,
                                ),
                              )),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: CustomButton(
                                isBorder: false,
                                isFilled: true,
                                onTap: () {},
                                child: Image.asset(
                                  "assets/icons/apple-logo.png",
                                  width: Get.width * 0.06,
                                  height: Get.width * 0.06,
                                ),
                              ))
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 35),
                          child: GestureDetector(
                            onTap: () {
                              Get.offAll(const LoginPage());
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: Get.width / 30,
                                      color: darkBlueColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Login here",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Get.width / 30,
                                          color: darkBlueColor),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
