import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      body: Container(
        color: AppColors.secondary,
        child: Center(
          child: Image.asset(Assets.logo),
        ),
      ),
    );
  }
}
