import 'package:hive/hive.dart';
import 'package:manzz_shop/model/product.dart';

class LocalPopularProductService {
  late Box<Product> _PopularProductBox;

  Future<void> init() async {
    _PopularProductBox = await Hive.openBox<Product>('PopularProduct');
  }

  Future<void> assignAllPopularProductList({required List<Product> PopularProduct}) async {
    await _PopularProductBox.clear();
    await _PopularProductBox.addAll(PopularProduct);
  }

  List<Product> getPopularProduct() => _PopularProductBox.values.toList();
}