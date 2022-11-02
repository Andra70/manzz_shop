import 'package:get/get.dart';
import 'package:manzz_shop/controller/dashboard_controller.dart';
import 'package:manzz_shop/controller/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
  }

}