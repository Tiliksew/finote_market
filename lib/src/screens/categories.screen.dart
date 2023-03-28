// ignore_for_file: implementation_imports

import 'package:finotemarket_app/src/controllers/category.controller.dart';
import 'package:finotemarket_app/src/controllers/categories.controller.dart';
import 'package:flutter/material.dart';
import 'package:finotemarket_app/src/widgets/category_card.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesController cc = Get.put(CategoriesController());
  CategoryController ccs = Get.put(CategoryController());

  getCategoriesAndSetState() async {
    // await cc.getCategories();
    await ccs.getCategories();
  }

  @override
  void initState() {
    super.initState();
    ccs.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    RxList categories = ccs.cateories;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getCategoriesAndSetState(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: GridView.builder(
                        itemCount: categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 3,
                                crossAxisSpacing: 3),
                        itemBuilder:
                            (_, int i) => /*CategoryItem(name: categories[i],)*/
                                CategoryCard(
                                    categoryName: categories[i].title,
                                    imagePath:
                                        'assets/images/${categories[i].img}.png',
                                        categoryKey: categories[i].key,)),
                  );
          },
        ),
      ),
    );
  }
}
