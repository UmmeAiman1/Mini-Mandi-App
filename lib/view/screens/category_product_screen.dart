import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/data/product_card_details.dart';

import 'package:minimandi/view/widget/custom_text.dart';
import 'package:minimandi/view/widget/product_card_widget.dart';

class CategoryProductScreen extends StatelessWidget {
  final String category;

  const CategoryProductScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final productCardDetails = ProductCardDetails();
    final List products = productCardDetails.getProductsByCategory(category);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: CustomText(
            text: category,
            color: AppColors.black,
            fontSize: 17,
            weight: FontWeight.bold,
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed(AppLinks.filter);
              },
              child: Image.asset(Assets.filter),
            ),
          ],
        ),
        body: Padding(
          padding: only(
            context,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              products.isEmpty
                  ? _buildEmptyProducts()
                  : Expanded(
                      child: _buildCategoryProducts(category),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildEmptyProducts() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Icon(
          Icons.inventory_2_outlined,
          color: AppColors.secondarydarkGrey,
          size: 45,
        ),
      ),
      Center(
        child: CustomText(
          text: 'No Products Available',
          color: AppColors.secondarydarkGrey,
          fontSize: 22,
          weight: FontWeight.w900,
        ),
      )
    ],
  );
}

Widget _buildCategoryProducts(String category) {
  final productCardDetails = ProductCardDetails();
  final List products = productCardDetails.getProductsByCategory(category);
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return ProductCardWidget(
        products: product,
        onTap: () {
          Get.toNamed(AppLinks.detail, arguments: products[index]);
        },
      );
    },
  );
}
