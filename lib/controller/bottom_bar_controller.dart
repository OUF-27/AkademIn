import 'package:appjam_project/ui/add%20content/add_content_page.dart';
import 'package:appjam_project/ui/home/home_page.dart';
import 'package:appjam_project/ui/profile/profile_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class BottomBarController extends GetxController {
  final controller = PersistentTabController(initialIndex: 0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(Get.context!, listen: false);
    await userProvider.refreshUser();
  }

  @override
  List<Widget> buildScreens() {
    return [const HomePage(), AddContentPage(), ProfilePage()];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "assets/icons/home.png",
          width: Get.width / 15,
          color: const Color(0xff4285F4),
        ),
        inactiveIcon: Image.asset(
          width: Get.width / 15,
          "assets/icons/home.png",
          color: CupertinoColors.systemGrey,
        ),
        title: ("Home"),
        activeColorPrimary: const Color(0xff4285F4),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          width: Get.width / 15,
          "assets/icons/plus.png",
          color: const Color(0xffDB4437),
        ),
        title: ("Settings"),
        inactiveIcon: Image.asset(
          width: Get.width / 15,
          "assets/icons/plus.png",
          color: CupertinoColors.systemGrey,
        ),
        activeColorPrimary: const Color(0xffDB4437),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          width: Get.width / 15,
          "assets/icons/user.png",
          color: const Color(0xff0F9D58),
        ),
        title: ("Profile"),
        inactiveIcon: Image.asset(
          width: Get.width / 15,
          "assets/icons/user.png",
          color: CupertinoColors.systemGrey,
        ),
        activeColorPrimary: const Color(0xff0F9D58),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
