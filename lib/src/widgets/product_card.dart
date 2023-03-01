import 'package:finotemarket_app/src/controllers/product.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String img;
  final int index;

  ProductCard({required this.img, required this.index, super.key});

  final ProductController pc = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/details', arguments: {'image': img, "index": index});
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${pc.products[index].price} Birr'),
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                    },
                    child: const Text("Order"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
