import 'package:get/get.dart';
import 'package:manzz_shop/servise/local_servise/local_ad_banner_servise.dart';
import 'package:manzz_shop/servise/local_servise/local_category_servise.dart';
import 'package:manzz_shop/servise/local_servise/local_product_servise.dart';
import '../model/product.dart';
import 'package:manzz_shop/servise/remote_servise/remote_popular_category_service.dart';
import '../servise/remote_servise/remote_popular_product_service.dart';
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
  final LocalPopularCategoryService _localPopularCategoryService = LocalPopularCategoryService();
  final LocalPopularProductService _localPopularProductService = LocalPopularProductService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    await _localPopularCategoryService.init();
    await _localPopularProductService.init();
    getAdbanners();
    getPopularCategories();
    getPopularProduct();
    super.onInit();
  }

  void getAdbanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad banner sebelum manggil api
      if (_localAdBannerService.getAdBanner().isNotEmpty){
        bannerList.assignAll(_localAdBannerService.getAdBanner());
      }
      var result = await remoteBannerServise().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
        _localAdBannerService.assignAllAdBannerList(adBanner: adBannerListFromJson(result.body));
      }
    } finally {
      print(bannerList.first.image);
      isBannerLoading.value = false;
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      //assigning local popular category sebelum manggil api
      if (_localPopularCategoryService.getPopularCategory().isNotEmpty){
        popularCategoryList.assignAll(_localPopularCategoryService.getPopularCategory());
      }
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
        _localPopularCategoryService.assignAllPopularCategoryList(popularCategories: popularCategoryListFromJson(result.body));
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
      //assigning local popular product sebelum manggil api
      if (_localPopularProductService.getPopularProduct().isNotEmpty){
        popularProductList.assignAll(_localPopularProductService.getPopularProduct());
      }
      var result = await RemotePopularProductService().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result.body));
        _localPopularProductService.assignAllPopularProductList(PopularProduct: popularProductListFromJson(result.body));
      }
    } finally {
      print(popularProductList.length);
      print(bannerList.first.image);
      isPopularProductLoading(false);
    }
  }
}
