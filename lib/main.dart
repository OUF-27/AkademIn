import 'package:appjam_project/bindings/network_binding.dart';
import 'package:appjam_project/constants/colors.dart';
import 'package:appjam_project/controller/add_content_controller.dart';
import 'package:appjam_project/providers/user_provider.dart';
import 'package:appjam_project/routes/app_pages.dart';
import 'package:appjam_project/services/network_manager.dart';
import 'package:appjam_project/ui/home/home_page.dart';
import 'package:appjam_project/ui/introduction/introduction_page.dart';
import 'package:appjam_project/ui/login/login_page.dart';
import 'package:appjam_project/widgets/bottom_bar_widget.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
    child: GetMaterialApp(
        initialBinding: NetworkBinding(),
        initialRoute: Routes.MYAPP,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        theme: ThemeData(fontFamily: 'Quicksand'),
        home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());
  final isLogin = false.obs;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetXNetworkManager>(
        builder: (builder) => _networkManager.connectionType.value == 0
            ? const Center(
                child: Text("No internet connection"),
              )
            : StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return BottomBarWidget();
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: greenColor),
                    );
                  }

                  return const IntroductionPage();
                },
              ));
  }
}
