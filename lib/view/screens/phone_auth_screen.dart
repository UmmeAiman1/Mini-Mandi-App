import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';

import 'package:minimandi/view/widget/custom_text.dart';
import 'package:minimandi/view/widget/custom_text_field.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

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
                  text: 'Enter your mobile number',
                  color: AppColors.black,
                  fontSize: 24,
                  weight: FontWeight.bold,
                  fontFamily: AppFonts.poppins,
                ),
                SizedBox(
                  height: height(context, 35),
                ),
                CustomText(
                  text: 'Mobile Number',
                  color: AppColors.secondarydarkGrey,
                  fontSize: 16,
                  weight: FontWeight.normal,
                  fontFamily: AppFonts.poppins,
                ),
                SizedBox(
                  height: height(context, 25),
                ),
                Padding(
                  padding: only(
                    context,
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (countryCode) => countryCode.dialCode,
                        initialSelection: 'PK',
                        favorite: const ['+92', 'PK'],
                        showCountryOnly: false,
                      ),
                      const Expanded(
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
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
          Get.toNamed(AppLinks.verify);
        },
        child: Icon(

          Icons.arrow_forward_ios,
          color: AppColors.stroke,
        ),
      ),
    );
  }
}
