import 'package:finotemarket_app/src/controllers/theme.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:finotemarket_app/src/constants/intropages.constants.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

ThemeController c = Get.put(ThemeController());

@override
void initState() {
    super.initState();
    c.saveFirstTimeLaunch();
  }
  
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
  pages: IntroPages.pages,
  showSkipButton: true,
  skip: const Text("Skip"),
  next: const Text("Next"),
  done: const Text("Done"),
  onDone: () {
    // When done button is press
    Get.offAllNamed('/home');
  },
  onSkip: () {
    Get.offAllNamed('/home');
    
  },
  baseBtnStyle: TextButton.styleFrom(
    backgroundColor: Colors.grey.shade200,
  ),  
  skipStyle: TextButton.styleFrom(primary: Colors.red),  
  doneStyle: TextButton.styleFrom(primary: Colors.green),  
  nextStyle: TextButton.styleFrom(primary: Colors.blue),
);
  }
}