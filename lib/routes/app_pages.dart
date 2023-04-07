import 'package:appjam_project/bindings/add_content_binding.dart';
import 'package:appjam_project/bindings/home_binding.dart';
import 'package:appjam_project/bindings/introduction_binding.dart';
import 'package:appjam_project/bindings/login_binding.dart';
import 'package:appjam_project/bindings/profile_binding.dart';
import 'package:appjam_project/bindings/register_binding.dart';
import 'package:appjam_project/main.dart';
import 'package:appjam_project/ui/Login/login_page.dart';
import 'package:appjam_project/ui/Register/register_page.dart';
import 'package:appjam_project/ui/add%20content/add_content_page.dart';
import 'package:appjam_project/ui/home/home_page.dart';
import 'package:appjam_project/ui/introduction/introduction_page.dart';
import 'package:appjam_project/ui/profile/profile_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.INTRO,
        page: () => const IntroductionPage(),
        binding: IntroductionBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(name: Routes.MYAPP, page: () => MyApp()),
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.ADDCONTENT,
        page: () => const AddContentPage(),
        binding: AddContentBinding()),
  ];
}
