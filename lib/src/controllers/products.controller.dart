// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:finotemarket_app/src/models/product.model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:finotemarket_app/src/constants/api.constants.dart';

class ProductsController extends GetxController {
  late RxList<dynamic> products = [].obs;
  late RxList<dynamic> categorizedProducts = [].obs;
  RxBool isFailed = false.obs;



  getProducts() async {
    String baseUrl = Api.baseUrl;
    try {
      if (products.isEmpty) {

        final response = await http.get(
          Uri.parse('$baseUrl/product'),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        final extractedRes = await json.decode(response.body);
        print(response.statusCode);
        if (response.statusCode != 200 && response.statusCode != 201) {
          throw HttpException(extractedRes['error']['message']);
        }
        final p = extractedRes['products'];
        for (var i = 0; i < p.length; i++) {
          products.add(Product.fromJson(p[i]));
        }
        print('length ${products.length}');
      }
      else {}
    } catch (e) {
      print('the error is $e');
      // throw HttpException(e.toString());
    }
  }
  getProductsFromCategory(String categoryName) async {
    String baseUrl = Api.baseUrl;
    try {

      print('$baseUrl/product?category=$categoryName');
        final response = await http.get(
          Uri.parse('$baseUrl/product?category=$categoryName'),
          headers: {
            'Content-Type': 'application/json',
          },
        );

          categorizedProducts = [].obs;
        final extractedRes = await json.decode(response.body);
        print(response.statusCode);
        if (response.statusCode != 200 && response.statusCode != 201) {
          categorizedProducts = [].obs;
          isFailed = true.obs;
          throw HttpException(extractedRes['error']['message']);
        }
        isFailed = false.obs;
        final p = extractedRes['products'];
        for (var i = 0; i < p.length; i++) {
          categorizedProducts.add(Product.fromJson(p[i]));
        }
        print('length ${categorizedProducts.length}');
      
    } catch (e) {
      print('the error is $e');
      rethrow;
      // throw HttpException(e.toString());
    }
  }

}
