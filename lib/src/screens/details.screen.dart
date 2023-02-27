import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String img = Get.arguments['image'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Details Screen'),
        Text(img,style: const TextStyle(fontSize: 20),),

      ],
    )));
  }
}