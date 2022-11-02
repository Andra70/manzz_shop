import 'dart:convert';

List<Product> popularProductListFromJson(String val) =>
  List<Product>.from(json.decode(val)['data']
  .map((category) => Product.popularProductfromJson(category))
  );

class Product {
  late final int id;
  late final String name;
  late final String description;
  late final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
  });

  factory Product.popularProductfromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['attributes']['product']['data']['attributes']['name'],
        description: data['attributes']['product']['data']['attributes']['description'],
        images: List<String>.from(data['attributes']['product']['data']['attributes']['image']['data'].map((image) => image['attributes']['url']),
        ),
      );
}
