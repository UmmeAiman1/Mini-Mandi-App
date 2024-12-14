import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';

import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';

import 'package:minimandi/view/widget/custom_button.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.secondary,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: only(
                context,
                top: height(context, 75),
              ),
              child: Image.asset(
                Assets.grocery,
                fit: BoxFit.cover,
              ),
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: 'Welcome to \nour store',
              color: AppColors.primary,
              fontSize: 35,
              weight: FontWeight.w900,
              fontFamily: AppFonts.poppins,
            ),
            CustomText(
                text: 'Get your groceries in as fast as one hour.',
                color: AppColors.secondarydarkGrey,
                fontSize: 14,
                weight: FontWeight.w300),
            SizedBox(
              height: height(context, 15),
            ),
            Center(
              child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Get.offAllNamed(AppLinks.signIn);
                  },
                  color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}
