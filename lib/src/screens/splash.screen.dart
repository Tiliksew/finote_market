import 'dart:async';

import 'package:finotemarket_app/src/controllers/theme.controller.dart';
import 'package:finotemarket_app/src/screens/home.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:finotemarket_app/src/constants/size.constants.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ThemeController c = Get.put(ThemeController());


  @override
  void initState() {
    super.initState();
     c.getFirstLaunch();
    c.getThemeStatus();
    Future.delayed(const Duration(seconds: 3), () {
      // navigateUser();
      checkSignedIn();
    });
  }

  void navigateUser() async {
    // checking whether user already loggedIn or not
        // AuthProvider authProvider = context.read<AuthProvider>();
        //  bool isLoggedIn = await authProvider.isLoggedIn();
        bool isLoggedIn = true;
         if (kDebugMode) {
           print("inside cheking app");
         }
    if (isLoggedIn) {
      // &&  FirebaseAuth.instance.currentUser.reload() != null
      Timer(
        const Duration(seconds: 10),
        () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()))
      );
    } 
  }
  void checkSignedIn() async {
    // AuthProvider authProvider = context.read<AuthProvider>();
    // bool isLoggedIn = await authProvider.isLoggedIn();
    // bool isLoggedIn = true;
    // bool isFirstTimeLaunch = false;
    bool isFirstTimeLaunch = c.isFirstTimeLaunch!.value;

    // isFirstTimeLaunch ? c.saveFirstTimeLaunch():'';
    // String route = isFirstTimeLaunch?'/intro':'/home';
    if(isFirstTimeLaunch) {
      Get.offAllNamed('/intro');
    } else {
      Get.offAllNamed('/home');
    }


    // if(isLoggedIn){
    //   if(kDebugMode){
    //     print("logged in");
    //   }
    //   // ignore: use_build_context_synchronously
    //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    // // Get.offAllNamed('/home');
    // Get.offAllNamed('/intro');

    // return;
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Welcome to ፍኖተMarket",style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Sizes.dimen_18),
            ),
             Image.asset(
              'assets/images/women5.png',
              width: 300,
              height: 300,
            ),
              const SizedBox(
              height: 20,
            ),
            
             const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}