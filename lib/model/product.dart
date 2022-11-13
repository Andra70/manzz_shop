import 'dart:convert';
import 'package:hive/hive.dart';

part 'product.g.dart';

List<Product> popularProductListFromJson(String val) =>
  List<Product>.from(json.decode(val)['data']
  .map((category) => Product.popularProductfromJson(category))
  );

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String description;
  @HiveField(3)
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
