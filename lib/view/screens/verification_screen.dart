import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/custom_text.dart';
import 'package:minimandi/view/widget/custom_text_field.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(Assets.splash),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Padding(
            padding: only(context, left: 20, top: 35, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: Get.back,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                SizedBox(
                  height: height(context, 35),
                ),
                CustomText(
                  text: 'Enter your 4 digit code',
                  color: AppColors.black,
                  fontSize: 24,
                  weight: FontWeight.bold,
                  fontFamily: AppFonts.poppins,
                ),
                SizedBox(
                  height: height(context, 35),
                ),
                CustomText(
                  text: 'Code',
                  color: AppColors.secondarydarkGrey,
                  fontSize: 16,
                  weight: FontWeight.normal,
                  fontFamily: AppFonts.poppins,
                ),
                SizedBox(
                  height: height(context, 15),
                ),
                const CustomTextField(
                  keyboardType: TextInputType.number,
                ),
                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Resend code',
                    color: AppColors.primary,
                    fontSize: 16,
                    weight: FontWeight.w900,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.offNamed(AppLinks.locator);
        },
        child: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.stroke,
        ),
      ),
    );
  }
}
