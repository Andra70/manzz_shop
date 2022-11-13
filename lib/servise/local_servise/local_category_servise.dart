import 'package:hive/hive.dart';
import '../../model/category.dart';

class LocalPopularCategoryService {
  late Box<Category> _PopularCategoryBox;

  Future<void> init() async {
    _PopularCategoryBox = await Hive.openBox<Category>('PopularCategories');
  }

  Future<void> assignAllPopularCategoryList({required List<Category> popularCategories}) async {
    await _PopularCategoryBox.clear();
    await _PopularCategoryBox.addAll(popularCategories);
  }

  List<Category> getPopularCategory() => _PopularCategoryBox.values.toList();
}