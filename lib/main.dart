import 'package:appjam_project/bindings/network_binding.dart';
import 'package:appjam_project/routes/app_pages.dart';
import 'package:appjam_project/services/network_manager.dart';
import 'package:appjam_project/ui/home/home_page.dart';
import 'package:appjam_project/ui/introduction/introduction_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      initialBinding: NetworkBinding(),
      initialRoute: Routes.MYAPP,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());
  final isLogin = false.obs;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetXNetworkManager>(
        builder: (builder) => _networkManager.connectionType.value == 0
            ? const Center(
                child: Text("No internet connection"),
              )
            : isLogin.value
                ? const HomePage()
                : const IntroductionPage(),
      ),
    );
  }
}
