import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';

import 'package:minimandi/view/widget/custom_text.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image(
              image: const AssetImage(Assets.check),
              height: height(context, 250),
              width: width(context, 250),
            )),
            sizedBoxheight(context),
            CustomText(
              text: 'Your order has been \naccepted',
              color: AppColors.black,
              fontSize: 24,
              weight: FontWeight.w900,
              textAlign: TextAlign.center,
            ),
            sizedBoxheight(context),
            CustomText(
              text:
                  'Your items have been placed and are on \ntheir way to being processed.',
              color: AppColors.secondarydarkGrey,
              fontSize: 12,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height(context, 15)),
            _buildButtons(context)
          ],
        ),
      ),
    );
  }
}

Widget _buildButtons(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: symmetric(context, horizontal: 25),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(width(context, 400), height(context, 55)),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.primary, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: CustomText(
              text: 'Track Order', color: AppColors.primary, fontSize: 17 ,weight: FontWeight.w900,),
        ),
      ),
      sizedBoxheight(context),
      TextButton(
        onPressed: () {
          Get.offAllNamed(AppLinks.bottomNavigation);
        },
        child: CustomText(
            text: 'Back To Home',
             color: AppColors.primary,
             fontSize: 16, weight: FontWeight.w900,),
      ),
    ],
  );
}
