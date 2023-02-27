
import 'package:finotemarket_app/src/screens/categories.screen.dart';
import 'package:finotemarket_app/src/screens/details.screen.dart';
import 'package:finotemarket_app/src/screens/home.screen.dart';
import 'package:finotemarket_app/src/screens/orders.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => const HomeScreen(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/details',
        page: () => const DetailsScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/orders',
        page: () => const OrdersScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
      ),

      GetPage(
        name: '/categories',
        page: () => const CategoriesScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
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