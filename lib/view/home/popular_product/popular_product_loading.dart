import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:manzz_shop/model/product.dart';
import 'popular_prodcut_loading_card.dart';

class PopularProductLoading extends StatelessWidget {
  const PopularProductLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding:  const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => const PopularProductLoadingCard()),
    );
  }
}
