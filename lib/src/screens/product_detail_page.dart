import 'package:finotemarket_app/src/controllers/products.controller.dart';
import 'package:finotemarket_app/src/widgets/order_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwesomeProductDetailsPage extends StatefulWidget {
  final String productTitle;
  final String productDescription;
  final double productPrice;
  final String productImageUrl;

  const AwesomeProductDetailsPage({
    Key? key,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.productImageUrl,
  }) : super(key: key);

  @override
  State<AwesomeProductDetailsPage> createState() =>
      _AwesomeProductDetailsPageState();
}

class _AwesomeProductDetailsPageState extends State<AwesomeProductDetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  int i = 0;

  final String img = Get.arguments['image'];
  final String title = Get.arguments['title'];
  final String price = Get.arguments['price'];
  final String description= Get.arguments['description'];

  final int index = Get.arguments['index'];
  final ProductsController pc = Get.put(ProductsController());

  @override
  void initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 350);
    opacityAnimation = CurvedAnimation(
        parent: Tween<double>(begin: 1, end: 0).animate(controller),
        curve: Curves.easeInOutExpo);
    // controller.animationBehavior =
  }

  @override
  Widget build(BuildContext context) {
    // Product selectedProduct = pc.categorizedProducts[index];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(img),
                  // Image.asset('assets/images/$img.png'),
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(Icons.favorite_border),
                          //   color: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$$price',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Description',
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 0.95,
                      child: FilledButton(
                          // style: ButtonStyle(),
                          onPressed: () {
                            showModalBottomSheet(
                                useSafeArea: true,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15)),
                                context: context,
                                transitionAnimationController: controller,
                                builder: (context) {
                                  return ListView(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.width/0.95,
                                        decoration: BoxDecoration(
                                            // color: Colors.amber,s
                                            borderRadius:
                                                BorderRadius.circular(20)),
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
                          child: const Text("Order Now")),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
