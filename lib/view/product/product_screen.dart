import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manzz_shop/component/main_header.dart';
import 'package:manzz_shop/view/product/components/product_loading_grid.dart';
import '../../controller/controller.dart';
import 'components/product_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(child: Obx(() {
            if (productController.productList.isNotEmpty) {
              return ProductGrid(products: productController.productList);
            } else {
              return const ProductLoadingGrid();
            }
          })),
        ],
      ),
    );
  }
}
