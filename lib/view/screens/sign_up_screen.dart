import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_styling.dart';
import '../../constants/app_images.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _buildSignUpHeader(context),
          _buildSignUpForm(context),
          _buildSignUpbutton(),
        ],
      ),
    );
  }
}

Widget _buildSignUpHeader(BuildContext context) {
  return Column(
    children: [
      Center(
        child: Image.asset(
          Assets.logo,
          height: height(context, 120),
          width: width(context, 120),
        ),
      ),
    ],
  );
}

Widget _buildSignUpForm(BuildContext context) {
  return Padding(
    padding: only(context, left: 15, right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height(context, 20),
        ),
        CustomText(
            text: 'Sign up',
            color: AppColors.black,
            fontSize: 24,
            weight: FontWeight.w600),
        SizedBox(
          height: height(context, 10),
        ),
        CustomText(
            text: 'Enter your credentials to create an account',
            color: AppColors.secondarydarkGrey,
            fontSize: 14,
            weight: FontWeight.w500),
        SizedBox(
          height: height(context, 30),
        ),
        CustomText(
            text: 'Username',
            color: AppColors.secondarydarkGrey,
            fontSize: 18,
            weight: FontWeight.normal),
        const CustomTextField(),
        SizedBox(
          height: height(context, 20),
        ),
        CustomText(
            text: 'Email',
            color: AppColors.secondarydarkGrey,
            fontSize: 18,
            weight: FontWeight.normal),
        const CustomTextField(),
        SizedBox(
          height: height(context, 20),
        ),
        CustomText(
            text: 'Password',
            color: AppColors.secondarydarkGrey,
            fontSize: 18,
            weight: FontWeight.normal),
        const CustomTextField(),
        SizedBox(
          height: height(context, 8),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: 'By continuing you agree to our ',
              style: TextStyle(color: AppColors.secondarydarkGrey),
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms of Services ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(
                    color: AppColors.secondarydarkGrey,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height(context, 20),
        ),
      ],
    ),
  );
}

Widget _buildSignUpbutton() {
  return Column(
    children: [
      Center(
        child: CustomButton(
            text: 'Sign up', onPressed: () {}, color: AppColors.primary),
      ),
      Center(
        child: TextButton(
          onPressed: () {
            Get.toNamed(AppLinks.login);
          },
          child: RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                fontFamily: AppFonts.poppins,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF181725),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Log in',
                  style: TextStyle(
                    fontFamily: AppFonts.poppins,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
