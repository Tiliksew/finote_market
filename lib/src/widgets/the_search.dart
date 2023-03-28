import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TheSearch extends SearchDelegate<String> {
  // TheSearch({required this.contextPage, required this.controller});

  // BuildContext contextPage;
  // WebViewController controller;
  // final suggestions1 = ["https://www.google.com"];
  final suggestions1 = [""];


  @override
  String get searchFieldLabel => "Enter product name";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      title: const Text("Adidas"),
      leading: const Icon(Icons.shopping_basket_rounded),
      trailing: const Icon(Icons.short_text),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Comming soon'),
        ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? suggestions1 : [];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (content, index) => ListTile(
         title: Text(suggestions[index])),
    );
  }
}