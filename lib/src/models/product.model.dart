class Product {
  late final String title;
  late final String price;
  late final String description;
  late final String category;
  late final List<dynamic> images;
  late final bool isActive;

  Product(
      {required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.isActive,
      required this.images});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    images = json['images'];
    isActive = json['isActive'];
  }
}
