import 'dart:ui';

import 'package:get/get.dart';
import 'package:manzz_shop/model/product.dart';
import 'package:manzz_shop/servise/remote_servise/local_service/local_ad_banner_service.dart';
import 'package:manzz_shop/servise/remote_servise/remote_popular_category_service.dart';
import 'package:manzz_shop/servise/remote_servise/remote_popular_product_service.dart';
import '../model/ad_banner.dart';
import '../model/category.dart';
import '../model/product.dart';
import '../servise/remote_servise/remote_banner_servis.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<Adbanner> bannerList = List<Adbanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = true.obs;
  RxBool isPopularCategoryLoading = true.obs;
  RxBool isPopularProductLoading = true.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    getAdbanners();
    getPopularCategories();
    getPopularProduct();
    super.onInit();
  }

  void getAdbanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad banners call api
      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }
      //call API
      var result = await remoteBannerServise().get();
      if (result != null) {
        //assign API result
        bannerList.assignAll(adBannerListFromJson(result.body));
        //save API result to local db
        _localAdBannerService.assignAllAdBanners(adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      print(bannerList.first.image);
      isBannerLoading.value = false;
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
      }
    } finally {
      print(popularCategoryList.length);
      print(bannerList.first.image);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);
      var result = await RemotePopularProductService().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result.body));
      }
    } finally {
      print(popularProductList.length);
      print(bannerList.first.image);
      isPopularProductLoading(false);
    }
  }
}
