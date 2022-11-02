import 'package:flutter/material.dart';
import '../popular_product/popular_product_card.dart';
import '../../../../model/product.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> popularProduct;
  const PopularProduct({Key? key, required this.popularProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: popularProduct.length,
          itemBuilder: (context, index) =>
              PopularProductCard(product: popularProduct[index])),
    );
  }
}
