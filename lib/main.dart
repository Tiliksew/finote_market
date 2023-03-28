import 'package:finotemarket_app/src/constants/theme.constant.dart';
import 'package:finotemarket_app/src/screens/splash.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finotemarket_app/src/constants/route.constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: CustomThemeData.darkTheme,
      theme: CustomThemeData.lightTheme,
      themeMode: ThemeMode.system,
      // home: const HomeScreen()
      home: const SplashScreen(),
      builder: EasyLoading.init(),
      
      // home: const WelcomeScreen(),

    );
  }
}
