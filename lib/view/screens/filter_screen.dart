import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:minimandi/constants/app_colors.dart';

import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/data/product_card_details.dart';
import 'package:minimandi/view/widget/custom_button.dart';
import 'package:minimandi/view/widget/custom_text.dart';
import '../../controllers/filter_controller.dart';

class FilterScreen extends StatelessWidget {
  final ProductCardDetails productCardDetails = ProductCardDetails();
  final FilterController filterController = Get.put(FilterController());

  FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.close)),
        title: CustomText(
          text: 'Filter',
          color: AppColors.black,
          fontSize: 18,
          weight: FontWeight.w900,
        ),
      ),
      body: Padding(
        padding: only(context, top: 20),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
       boxShadow:[ BoxShadow(
        color: AppColors.secondarydarkGrey.withOpacity(0.4),
        blurRadius: 5,
        spreadRadius: 0
       )],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            color: const Color(0xffF2F3F2),
          ),
          child: Column(
            children: [
              _buildFilterContainer(filterController, context),
              const Spacer(),
              _buildButtons(context),
              sizedBoxheight(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildFilterContainer(
    FilterController filterController, BuildContext context) {
  return Padding(
    padding: only(context, left: 15, right: 15, top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: height(context, 15),
        ),
        Column(
          children: filterController.categories.map((category) {
            return Row(
              children: [
                Obx(
                  () => Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    checkColor: AppColors.white,
                    activeColor: AppColors.primary,
                    value:
                        filterController.selectedCategories.contains(category),
                    onChanged: (_) => filterController.toggleCategory(category),
                  ),
                ),
                CustomText(
                  text: category,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(height: height(context, 15)),
        CustomText(
          text: 'Brand',
          color: AppColors.black,
          fontSize: 22,
          weight: FontWeight.w900,
        ),
        SizedBox(height: height(context, 15)),
        Column(
          children: filterController.brands.map((brand) {
            return Row(
              children: [
                Obx(
                  () => Checkbox( shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    checkColor: AppColors.white,
                    activeColor: AppColors.primary,
                    value: filterController.selectedBrands.contains(brand),
                    onChanged: (_) => filterController.toggleBrand(brand),
                  ),
                ),
                CustomText(
                  text: brand,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

Widget _buildButtons(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center,
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
              text: 'Reset Settings', color: AppColors.primary, fontSize: 17),
        ),
      ),
      sizedBoxheight(context),
      CustomButton(text: 'Apply FIlter', onPressed: (){
        Get.back();
      }, color: AppColors.primary)
    ],
  );
}
