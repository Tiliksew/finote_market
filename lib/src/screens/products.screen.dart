import 'package:finotemarket_app/src/controllers/product.controller.dart';
import 'package:finotemarket_app/src/controllers/theme.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finotemarket_app/src/widgets/product_card.dart';
import 'package:finotemarket_app/src/controllers/products.controller.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  RxBool isLightTheme = false.obs;
  final ThemeController c = Get.put(ThemeController());
  final ProductController pc = Get.put(ProductController());
  final ProductsController pcs = Get.put(ProductsController());
  final String category = Get.arguments['cateogry'];
  final String categoryKey = Get.arguments['key'];

  // bool isFailed = false;

  PageController page = PageController(initialPage: 0, viewportFraction: 0.9);
  getProductsAndSetState() async {
    try {
      await pcs.getProductsFromCategory(categoryKey);
    } catch (e) {
      if (kDebugMode) {
        print('error inside widget $e');
      }
      // setState(() {
      //   isFailed = true;
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    // pc.setProducts();
    // getProductsAndSetState();
    // c.getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(category),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getProductsAndSetState(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      await getProductsAndSetState();
                    },
                    child: SafeArea(
                      child: pcs.isFailed.value
                          ? RefreshIndicator(
                              onRefresh: () async {
                                await getProductsAndSetState();
                              },
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/page-not-found.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    const Text('No products found!'),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 3,
                                                crossAxisSpacing: 3),
                                        itemCount:
                                            pcs.categorizedProducts.length,
                                        itemBuilder: (context, int i) =>
                                            ProductCard(
                                              img: pcs.categorizedProducts[i]
                                                  .images[0],
                                                  price: pcs.categorizedProducts[i].price,
                                                  title: pcs.categorizedProducts[i].title,
                                                  description: pcs.categorizedProducts[i].description,
                                              index: i,
                                            )),
                                  )
                                ],
                              ),
                            ),
                    ),
                  );
          },
        ));
  }
}
