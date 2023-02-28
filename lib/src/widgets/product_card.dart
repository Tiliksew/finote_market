import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String img;
  final int index;

  const ProductCard({ required this.img,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/details',arguments: {'image':img,"index":index});
      },
      child: Container(
                      // width: MediaQuery.of(context).size.width,
                      height: 50,
                      padding: const EdgeInsets.all(38),
                      decoration:  BoxDecoration(
                      color: const Color.fromARGB(255, 226, 243, 227),
                            image:  DecorationImage(
                              scale: 0.6,
                              // image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                              image: AssetImage('assets/images/$img.png'),
                              fit: BoxFit.scaleDown,
                            ),
                            // border: Border.all(
                            //   width: 0,
                            // ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                    ),
    );
                  
  }
}