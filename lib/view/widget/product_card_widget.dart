import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_styling.dart';

import 'package:minimandi/models/product_card_model.dart';
import 'package:minimandi/controllers/cart_controller.dart';

class ProductCardWidget extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final VoidCallback onTap;
  final ProductCardModel products;
  ProductCardWidget({super.key, required this.products, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 230),
      width: width(context, 173),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: height(context, 243),
          width: width(context, 173),
          child: Card(
            color: Colors.white,
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: height(context, 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      products.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: only(context, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products.title,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          fontFamily: AppFonts.poppins,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        products.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.secondarydarkGrey),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              products.formattedPrice,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                fontFamily: AppFonts.poppins,
                              ),
                            ),
                            Container(
                              height: height(context, 45),
                              width: width(context, 45),
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(17)),
                              child: IconButton(
                                onPressed: () {
                                  cartController.addToCart(products);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
