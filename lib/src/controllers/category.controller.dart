// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:finotemarket_app/src/constants/api.constants.dart';

class CategoriesController extends GetxController {
  late RxList<dynamic> cateories = [].obs;

  getCategories() async {
    String baseUrl = Api.baseUrl;
    try {
      if (cateories.isEmpty) {
        final response = await http.post(
          Uri.parse('$baseUrl/categories'),
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
          cateories.add(element);
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
