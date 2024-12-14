import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controllers/home_controller.dart';
import 'package:minimandi/data/product_card_details.dart';
import 'package:minimandi/models/product_card_model.dart';

import 'package:minimandi/view/widget/custom_text.dart';
import 'package:minimandi/view/widget/grocery_card_widget.dart';
import 'package:minimandi/view/widget/product_card_widget.dart';

class HomeScreen extends StatelessWidget {

  final HomeController homeController =
      Get.put(HomeController(), permanent: true);
  HomeScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: only(context, left: 20, right: 20),
          child: Obx(() {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context, homeController),
                  SizedBox(height: height(context, 10)),
                  if (homeController.filteredProducts.isNotEmpty) ...[
                    _buildSearchResults(context, homeController),
                  ] else ...[
                    _buildCategorySections(context), 
                  ],
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context, HomeController homeController,) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Image.asset(Assets.logo2),
      ),
      SizedBox(
        height: height(context, 8),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on),
          SizedBox(
            width: width(context, 8),
          ),
          CustomText(
            text: 'Faiz Road, Lahore',
            color: AppColors.primary,
            fontSize: 15,
            weight: FontWeight.bold,
          ),
        ],
      ),
      SizedBox(
        height: height(context, 10),
      ),
   SearchBar(
  
        leading: Padding(
          padding: only(context, left: 10, right: 8),
          child: const Icon(Icons.search_outlined),
        ),
        hintText: 'Search Store',
        hintStyle: WidgetStatePropertyAll(
          TextStyle(fontFamily: AppFonts.poppins),
        ),
        elevation: const WidgetStatePropertyAll<double>(0),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
          ),
        ),
      ),
      SizedBox(
        height: height(context, 10),
      ),
      Image.asset(Assets.banner),
    ],
  );
}

Widget _buildCategoryHeader(String title, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        color: AppColors.black,
        fontSize: 23,
        weight: FontWeight.w900,
      ),
      CustomText(
        text: 'See All',
        color: AppColors.primary,
        fontSize: 17,
        weight: FontWeight.bold,
      ),
    ],
  );
}

Widget _buildSearchResults(BuildContext context, HomeController homeController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: 'Search Results',
        color: AppColors.black,
        fontSize: 23,
        weight: FontWeight.w900,
      ),
      SizedBox(height: height(context, 10)),
      if (homeController.filteredProducts.isEmpty)
        Center(
          child: Column(
            children: [
              Icon(
                Icons.search_off,
                color: AppColors.secondarydarkGrey,
                size: 60,
              ),
              SizedBox(height: height(context, 10)),
              CustomText(
                text: 'No Products Found',
                color: AppColors.secondarydarkGrey,
                fontSize: 18,
                weight: FontWeight.bold,
              ),
            ],
          ),
        )
      else
        ListView.builder(
          shrinkWrap: true, 
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeController.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = homeController.filteredProducts[index];
            return ProductCardWidget(
              products: product,
              onTap: () {
                Get.toNamed(AppLinks.detail, arguments: product);
              },
            );
          },
        ),
    ],
  );
}

Widget _buildProducts(BuildContext context, String category) {
  List<ProductCardModel> product =
      ProductCardDetails().getProductsByCategory(category);
  return SizedBox(
    height: height(context, 230),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: product.length,
      itemBuilder: (context, index) {
        return ProductCardWidget(
          products: product[index],
          onTap: () {
            Get.toNamed(AppLinks.detail, arguments: product[index]);
          },
        );
      },
    ),
  );
}

Widget _buildCategorySections(BuildContext context) {
  List<String> categories = ['Exclusive Offer', 'Best Selling', 'Groceries'];

  return Column(
    children: categories.map((category) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(category, context),
          SizedBox(height: height(context, 10)),
          if (category == 'Groceries') ...[
            groceryRow(),
            SizedBox(height: height(context, 10)),
          ],
          _buildProducts(
            context,
            category,
          ),
          SizedBox(height: height(context, 10)),
        ],
      );
    }).toList(),
  );
}

Widget groceryRow() {
  return const SingleChildScrollView(
    child: Row(
      children: [
        GroceryCardWidget(
          color: Color(0xffF8A44C),
          image: Assets.pulse,
          title: 'Pulse',
        ),
        GroceryCardWidget(
          color: Color(0xff53B175),
          image: Assets.rice,
          title: 'Rice',
        ),
      ],
    ),
  );
}
