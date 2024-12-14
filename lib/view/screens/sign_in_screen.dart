import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/custom_button.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.splash,
            ),
            Padding(
              padding: only(context, right: 20, left: 20, top: 20),
              child: CustomText(
                textAlign: TextAlign.start,
                text: 'Get your groceries \nwith Mini Mandi',
                color: AppColors.black,
                fontSize: 24,
                weight: FontWeight.w600,
                fontFamily: AppFonts.poppins,
              ),
            ),
            SizedBox(
              height: height(context, 25),
            ),
            Padding(
              padding: only(context, right: 20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppLinks.phoneauth);
                },
                child: Row(
                  children: [
                    Padding(
                      padding: only(context, left: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppLinks.phoneauth);
                        },
                        child: SizedBox(
                          height: height(context, 60),
                          child: CountryCodePicker(
                            onChanged: (countryCode) => countryCode.dialCode,
                            initialSelection: 'PK',
                            favorite: const ['+92', 'PK'],
                            showCountryOnly: false,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height(context, 10),
            ),
            Center(
              child: CustomText(
                text: 'Or',
                color: AppColors.secondarydarkGrey,
                fontSize: 18,
                weight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: height(context, 8),
            ),
            CustomButton(
              image: Assets.google,
              text: 'Continue with Google',
              onPressed: () {
        
              },
              color: const Color(0xff5383EC),
            ),
            SizedBox(
              height: height(context, 8),
            ),
            CustomButton(
                image: Assets.apple,
                text: 'Continue with Apple',
                onPressed: () {},
                color: AppColors.black),
            SizedBox(
              height: height(context, 8),
            ),
          ],
        ),
      ),
    );
  }
}
