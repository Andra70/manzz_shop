import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manzz_shop/component/main_header.dart';
import 'package:manzz_shop/controller/controller.dart';
import 'package:manzz_shop/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:manzz_shop/view/home/components/popular_category/popular_category.dart';
import 'package:manzz_shop/view/home/components/popular_category/popular_category_loading.dart';
import 'package:manzz_shop/view/home/components/section_title.dart';
import 'package:manzz_shop/view/home/popular_product/popular_product.dart';
import 'package:manzz_shop/view/home/popular_product/popular_product_loading.dart';
import 'components/carousel_slider/carousel_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(() {
                if (homeController.bannerList.isNotEmpty) {
                  return CarouselSliderView(
                      bannerList: homeController.bannerList);
                } else {
                  return CarouselLoading();
                }
              }),
              const SectionTitle(title: "Popular Category"),
              Obx(() {
                if (homeController.popularCategoryList.isNotEmpty) {
                  return PopularCategory(
                      categories: homeController.popularCategoryList);
                } else {
                  return const PopularCategoryLoading();
                }
              }),
              const SectionTitle(title: "Popular Product"),
              Obx(() {
                if (homeController.popularProductList.isNotEmpty) {
                  return PopularProduct(
                    popularProduct: homeController.popularProductList,
                  ); //why this eror? because i don't have PopularProductLoading
                } else {
                  return const PopularCategoryLoading();
                }
              }),
            ],
          ),
        ))
      ],
    ));
  }
}
