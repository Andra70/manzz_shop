import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manzz_shop/const.dart';
import 'package:shimmer/shimmer.dart';
import '../../../model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: baseUrl + product.images.first,
                  placeholder: (context, url) => Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey.shade300,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.grey.shade300,
                      ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                    Icons.error_outline,
                    color: Colors.grey
                    ),
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(product.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text('\$${product.tags.first.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
