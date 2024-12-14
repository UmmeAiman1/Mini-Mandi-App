import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/custom_button.dart';
import 'package:minimandi/view/widget/custom_text.dart';
import 'package:minimandi/view/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: only(context,  top: 15),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.logo,
                     height: height(context, 120),
                     width: width(context, 120),
                    ),
                  ),
                  Padding(
                    padding: only(context, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height(context, 25),
                        ),
                        CustomText(
                            text: 'Login',
                            color: AppColors.black,
                            fontSize: 24,
                            weight: FontWeight.w600),
                        CustomText(
                            text: 'Enter your email and password',
                            color: AppColors.secondarydarkGrey,
                            fontSize: 17,
                            weight: FontWeight.w500),
                        SizedBox(
                          height: height(context, 30),
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child:  Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 14,
                                    color:AppColors.primary
                                    ),
                              ),),
                        ),
                        SizedBox(height: height(context, 8),),
                        Center(
                          child: CustomButton(
                              text: 'Login',
                              onPressed: () {
                                Get.offNamed(AppLinks.bottomNavigation);
                              },
                              color: AppColors.primary),
                        ),
                           SizedBox(height: height(context, 8),),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppLinks.signup);
                            },
                            child: RichText(
                              text: TextSpan(
                                
                                text: 'Don\'t have an account?',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color:Color(0xFF181725),
                                    ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
