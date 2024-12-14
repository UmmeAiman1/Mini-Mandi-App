import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';

import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';

import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/custom_button.dart';
import 'package:minimandi/view/widget/custom_text.dart';

import '../widget/custom_text_field.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            Assets.splash,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: Get.back,
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Padding(
            padding: only(context, left: 20, right: 30, top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(Assets.locator),
                  ),
                  SizedBox(
                    height: height(context, 20),
                  ),
                  CustomText(
                    text: 'Select your location',
                    color: AppColors.black,
                    fontSize: 24,
                    weight: FontWeight.bold,
                    fontFamily: AppFonts.poppins,
                  ),
                  SizedBox(
                    height: height(context, 10),
                  ),
                  CustomText(
                      textAlign: TextAlign.center,
                      text:
                          'Switch on your location to stay in tune with \nwhat\'s happening in your area',
                      color: AppColors.secondarydarkGrey,
                      fontSize: 14,
                      weight: FontWeight.normal),
                  Padding(
                    padding: only(context, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                              text: 'Your Zone',
                              color: AppColors.secondarydarkGrey,
                              fontSize: 14,
                              weight: FontWeight.normal),
                        ),
                        const CustomTextField(),
                        SizedBox(
                          height: height(context, 10),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                              text: 'Your Area',
                              color: AppColors.secondarydarkGrey,
                              fontSize: 14,
                              weight: FontWeight.normal),
                        ),
                         CustomTextField(
                         
                            hintText: 'Types of your area', 
                            hintStyle: TextStyle(color: AppColors.secondarydarkGrey, fontSize: 16)
                          
                        ),
                        SizedBox(
                          height: height(context, 60),
                        ),
                        CustomButton(
                            text: 'Submit',
                            onPressed: () {
                              Get.toNamed(AppLinks.login);
                            },
                            color: AppColors.primary),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
