import 'dart:async';

import 'package:finotemarket_app/src/controllers/products.controller.dart';
import 'package:finotemarket_app/src/controllers/theme.controller.dart';
import 'package:finotemarket_app/src/screens/home.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:finotemarket_app/src/constants/size.constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobile_number/mobile_number.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ThemeController c = Get.put(ThemeController());
  ProductsController pcs = Get.put(ProductsController());
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];
getProductsAndSetState() async {
    await pcs.getProducts();
  }

  @override
  void initState() {
    super.initState();
     c.getFirstLaunch();
     MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
    //  getProductsAndSetState();
    c.getThemeStatus();

    Future.delayed(const Duration(seconds: 3), () {
      // navigateUser();
      checkSignedIn();
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }  
Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix} ${sim.number}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }
  // void navigateUser() async {
  //   // checking whether user already loggedIn or not
  //       // AuthProvider authProvider = context.read<AuthProvider>();
  //       //  bool isLoggedIn = await authProvider.isLoggedIn();
  //       bool isLoggedIn = true;
  //        if (kDebugMode) {
  //          print("inside cheking app");
  //        }
  //   if (isLoggedIn) {
  //     // &&  FirebaseAuth.instance.currentUser.reload() != null
  //     Timer(
  //       const Duration(seconds: 6),
  //       () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()))
  //     );
  //   } 
  // }
  
  void checkSignedIn() async {
    // AuthProvider authProvider = context.read<AuthProvider>();
    // bool isLoggedIn = await authProvider.isLoggedIn();
    // bool isLoggedIn = true;
    // bool isFirstTimeLaunch = false;
    bool isFirstTimeLaunch = c.isFirstTimeLaunch!.value;

    // isFirstTimeLaunch ? c.saveFirstTimeLaunch():'';
    // String route = isFirstTimeLaunch?'/intro':'/home';
    if(isFirstTimeLaunch) {
      Get.offAllNamed('/intro',arguments: {"prifix":_simCard[0].countryPhonePrefix,"phoneNumber":_simCard[0].number});
    } else {
      Get.offAllNamed('/home',arguments: {"prifix":_simCard[0].countryPhonePrefix,"phoneNumber":_simCard[0].number});
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Welcome to ፍኖተMarket",style: TextStyle(
              color: Colors.black,
                  fontWeight: FontWeight.bold, fontSize: Sizes.dimen_18),
            ),
            //  Image.asset(
            //   'assets/images/women5.png',
            //   width: 300,
            //   height: 300,
            // ),
            Icon(Icons.production_quantity_limits,color: Colors.black,),
              SizedBox(
              height: 20,
            ),
            // Text('Running on: $_mobileNumber\n'),
              // fillCards()

            
            //  CircularProgressIndicator(
            //   color: Colors.white,
            // ),
          ],
        ),
      ),
    );
  }
}