import 'dart:math';

import 'package:appjam_project/constants/colors.dart';
import 'package:appjam_project/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import 'package:appjam_project/models/user_model.dart' as model;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(ProfileController());
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = GetStorage().read("themeIndex");
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: ListView(children: [
        Obx(() => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.width / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(controller
                                      .profileThemeList[index].capture))),
                        ),
                        Obx(() => Container(
                              width: Get.width,
                              height: Get.width / 2,
                              decoration: BoxDecoration(
                                  color:
                                      controller.profileThemeList[index].color),
                            )),
                      ],
                    ),
                    Container(
                      width: Get.width - 100,
                      height: Get.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: controller.profileThemeList[index].color,
                                offset: Offset(0, 5),
                                spreadRadius: 8,
                                blurRadius: 20)
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Collection",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Get.width / 24),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 15),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 8.0,
                          children: List.generate(
                            10,
                            (index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(12)),
                                height: 50,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: Get.width / 4,
                    child: Container(
                      width: Get.width - 60,
                      height: Get.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ],
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 1.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2)
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: Get.width / 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  user.username,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Get.width / 20),
                                ),
                                Text(
                                  user.email,
                                  style: TextStyle(
                                      color: blueColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.width / 27),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "text1",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Get.width / 27),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "000",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Get.width / 22),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "text1",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Get.width / 27),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "000",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Get.width / 22),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "text1",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Get.width / 27),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "000",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Get.width / 22),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    top: Get.width / 6,
                    child: Container(
                      width: Get.width / 4,
                      height: Get.width / 4,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: controller.profileThemeList[index].color,
                                offset: Offset(0, 5),
                                blurRadius: 10),
                          ],
                          shape: BoxShape.circle,
                          color: Color(0xfff7f7f7),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/default_profile.png"))),
                    ))
              ],
            )),
      ]),
    );
  }
}
