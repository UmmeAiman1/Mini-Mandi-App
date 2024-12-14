import 'package:get/get.dart';
import 'package:minimandi/controllers/bottom_navigation_controller.dart';
import 'package:minimandi/controllers/favorite_controller.dart';
import 'package:minimandi/controllers/filter_controller.dart';

import 'package:minimandi/controllers/splash_controller.dart';


import '../../controllers/cart_controller.dart';

class AppBindings extends Bindings {
  
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(BottomNavigationController());
    Get.lazyPut(()=> FavoriteController());
    Get.lazyPut(() => FilterController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
