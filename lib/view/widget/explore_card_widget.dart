import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/data/explore_card_details.dart';

import 'package:minimandi/view/widget/custom_text.dart';

class ExploreCardWidget extends StatelessWidget {

  const ExploreCardWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    final explorecardDetails = ExploreCardDetails();
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: explorecardDetails.explorCardData.length,
          itemBuilder: (context, index) {
            final cardData = explorecardDetails.explorCardData[index];
            return InkWell(
              onTap: () {
              Get.toNamed(AppLinks.beverage, parameters: {'category': cardData.title});

              },
              child: Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: cardData.borderColor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
                color: cardData.color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: cardData.image),
                    SizedBox(
                      height: height(context, 15),
                    ),
                    CustomText(
                      textAlign: TextAlign.center,
                      text: cardData.title,
                      color: AppColors.black,
                      fontSize: 16,
                      weight: FontWeight.w900,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
