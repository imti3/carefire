import 'package:carefire/pages/Splash_Screen.dart';
import 'package:carefire/widgets/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/routes.dart';
import 'config/themes.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CARETUTORS',
      darkTheme: themeController.darkTheme,
      theme: themeController.lightTheme,
      getPages: pages,

      home: SplashScreen(),
    );
  }
}
