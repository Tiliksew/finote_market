import 'package:finotemarket_app/src/controllers/products.controller.dart';
import 'package:finotemarket_app/src/widgets/order_form.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>  with SingleTickerProviderStateMixin{

    late AnimationController controller;
    late Animation<double> opacityAnimation;
    int i = 0;

  final String img = Get.arguments['image'];
  final int index = Get.arguments['index'];
  final String title = Get.arguments['title'];
  final String price = Get.arguments['price'];
  final String description= Get.arguments['description'];

  final ProductsController pc = Get.put(ProductsController());

@override
void initState() {
    super.initState();
    controller =
        BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 350);
     opacityAnimation = CurvedAnimation(
        parent: Tween<double>(begin: 1, end: 0).animate(controller),
        curve: Curves.easeInOutExpo);
    // controller.animationBehavior = 
  }

  @override
  Widget build(BuildContext context) {
    // Product selectedProduct = pc.products[index];
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Text('Details Screen'),
        Stack(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
              padding: const EdgeInsets.all(38),
              decoration: BoxDecoration(
                // boxShadow: const [
                //   BoxShadow(
                //       // color: Color.fromARGB(255, 6, 88, 165),
                //       blurRadius: 2,
                //       offset: Offset(4, 5))
                // ],
                // color: Theme.of(context).primaryColor,
                image: DecorationImage(
                  scale: 0.6,
                  image: NetworkImage(img),
                  // image: AssetImage('assets/images/$img.png'),
                  fit: BoxFit.scaleDown,
                ),
                // border: Border.all(
                //   width: 0,
                // ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(25, 15),
                    bottomRight: Radius.elliptical(25, 15)),
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  // color: Colors.white,
                ))
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '$title - ${price}ETB',
                  style: const TextStyle(fontSize: 20),
                ),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 20),
                ),
                FilledButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        shape: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
                          context: context,
                          transitionAnimationController: controller,
                          builder: (context) {
                            return ListView(
                              children: [
                                Container(
                                  
                                  decoration: BoxDecoration(
                                    // color: Colors.amber,s
                                      borderRadius: BorderRadius.circular(20)),
                                  // child: Wrap(
                                  //   children: const [
                                  //     ListTile(
                                  //       leading: Icon(Icons.share),
                                  //       title: Text('Share'),
                                  //     ),
                                  //     ListTile(
                                  //       leading: Icon(Icons.copy),
                                  //       title: Text('Copy Link'),
                                  //     ),
                                  //     ListTile(
                                  //       leading: Icon(Icons.edit),
                                  //       title: Text('Edit'),
                                  //     ),

                                  //   ],
                                  // ),
                                  child: const OrderForm(),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text("Order Now"))
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
