
import 'package:finotemarket_app/src/screens/categories.screen.dart';
import 'package:finotemarket_app/src/screens/home.screen.dart';
import 'package:finotemarket_app/src/screens/introduction.screen.dart';
import 'package:finotemarket_app/src/screens/orders.screen.dart';
import 'package:finotemarket_app/src/screens/product_detail_page.dart';
import 'package:finotemarket_app/src/screens/products.screen.dart';
import 'package:finotemarket_app/src/screens/search.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => const HomeScreen(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/intro',
        page: () => const WelcomeScreen(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/details',
        page: () => const /*DetailsScreen(),*/AwesomeProductDetailsPage(
  productTitle: 'Awesome Product',
  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  productPrice: 19.99,
  productImageUrl: 'https://example.com/product-image.jpg',
),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/products',
        page: () => const /*DetailsScreen(),*/ProductsScreen(
  // productTitle: 'Awesome Product',
  // productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  // productPrice: 19.99,
  // productImageUrl: 'https://example.com/product-image.jpg',
),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/orders',
        page: () => const OrdersScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
      ),

      GetPage(
        name: '/categories',
        page: () => const CategoriesScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/search',
        page: () => const SearchScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (kDebugMode) {
      print(page?.name);
    }
    return super.onPageCalled(page);
  }
}