// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:finotemarket_app/src/constants/api.constants.dart';
import 'package:finotemarket_app/src/models/category.model.dart';

// imp

class CategoryController extends GetxController {
  late RxList<dynamic> cateories = [].obs;

  getCategories() async {
    String baseUrl = Api.baseUrl;
    try {
      if (cateories.isEmpty) {
        final response = await http.get(
          Uri.parse('$baseUrl/category'),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        final extractedRes = await json.decode(response.body);
        if(response.statusCode!=200){
          throw HttpException(extractedRes['error']['message']);
        }
        // cateories = extractedRes['categories'];
        // print('categories ${extractedRes['categories']} ');
        cateories.retainWhere((element) => false);
        for (var element in extractedRes['categories']) {
          cateories.add(Category.fromJson(element));
          print(element);
        }
        print(cateories);
      } else {}
    } catch (e) {
      print(e);
      // throw HttpException(e.toString());
    }
  }
}
