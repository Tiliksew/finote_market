import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final String categoryKey;

  const CategoryCard({super.key, required this.categoryName, required this.imagePath,required this.categoryKey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       focusColor: Theme.of(context).primaryColor,
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        Get.toNamed('/products',arguments: {"cateogry":categoryName,"key":categoryKey});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
              child: Image.asset(
                imagePath,
                height: 80.0,
                width: 80.0,
              ),
            ),
           const SizedBox(height: 8.0),
            Text(
              categoryName,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}