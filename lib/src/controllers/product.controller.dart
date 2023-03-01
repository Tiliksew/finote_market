import 'dart:convert';

import 'package:finotemarket_app/src/models/product.model.dart';
import 'package:finotemarket_app/src/constants/temp.products.dart';

import 'package:get/get.dart';

class ProductController extends GetxController{
 late  RxList<dynamic> products = [].obs;

  setProducts(){
    List p = json.decode(ProductsListClass.productsList);
    for (var i = 0; i < p.length; i++) {
      // products.add(Product(title: p[i].title, description: p[i].description, price: p[i].price, category: p[i].category, isActive: p[i].isActive, images: p[i].images));
   products.add(Product.fromJson(p[i]));
    }
  }
}