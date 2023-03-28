class Category {
  late final String title;
  late final String img;
  late final String key;


  Category(
      {required this.title,
      required this.img,
      required this.key});

  Category.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
    key = json['key'];
  }
}
