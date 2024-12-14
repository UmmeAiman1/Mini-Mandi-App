import 'dart:async';

import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    splashSscreenHandler();

    super.onInit();
  }

  

  void splashSscreenHandler() async {
    
 await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppLinks.onBoarding);
    
   
  }
}
