import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String img;
  final String title;
  final String price;
  final String description;

  final int index;

  const ProductCard({required this.img, required this.title,required this.price,required this.index,required this.description, super.key});

  // final ProductController pc = Get.put(ProductController());
  // final ProductsController pc = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/details', arguments: {'image': img,"title":title, "index": index,"price": price,"description": description});
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).highlightColor),
        child: Wrap(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width,
              height: 120,
              padding: const EdgeInsets.all(38),
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 226, 243, 227),

                // color: Colors.amberAccent,
                image: DecorationImage(
                  scale: 0.6,
                  image: NetworkImage(img),
                  // image: AssetImage('assets/images/$img.png'),
                  fit: BoxFit.scaleDown,
                ),
                // border: Border.all(
                //   width: 0,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(height: 50,),
                  Text(title,style: const TextStyle(fontSize: 12),),
                  Text('${price}Br'),
                  

                  // FilledButton(
                  //   style: FilledButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                  //   onPressed: () {
                  //   },
                  //   child: const Text("Order"),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
