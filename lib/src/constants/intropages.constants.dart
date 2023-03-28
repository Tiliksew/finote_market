import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPages {
  static  List<PageViewModel> pages = [
    PageViewModel(
  title: "ፍኖተMarket",
  body: "Get anything with one click 👆",
  image:  Center(
    child: Image.asset("assets/images/shopping-cart.gif", height: 175.0),
  ),
),
PageViewModel(
  title: "24/7 Online",
  body: "You can order anytime anywhere ⏱",
  image: Center(
    child: Image.asset("assets/images/24-hours.gif", height: 175.0),
  ),
  decoration: const PageDecoration(
    // pageColor: Colors.blue,
  ),
),
PageViewModel(
  title: "Free Delivery",
  body: "Recieve your order for free",
  image:  Center(
    child: Image.asset("assets/images/truck.gif", height: 175.0),
  ),
  decoration: const PageDecoration(
    // titleTextStyle: TextStyle(color: Colors.orange),
    // bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
  ),
),

// PageViewModel(
//   title: "Title of custom body page",
//   bodyWidget: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: const [
//       Text("Click on "),
//       Icon(Icons.edit),
//       Text(" to edit a post"),
//     ],
//   ),
//   image: const Center(child: Icon(Icons.android)),
// )
 
  ];
}