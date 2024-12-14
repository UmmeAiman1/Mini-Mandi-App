// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';

import 'package:minimandi/models/product_card_model.dart';
import 'package:minimandi/controllers/cart_controller.dart';
import 'package:minimandi/controllers/product_detail_controller.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class CartTileWidget extends StatelessWidget {
  final ProductCardModel product;
  final CartController cartController = Get.find();

  CartTileWidget({super.key, required this.product});

  @override
  Widget build(
    BuildContext context,
  ) {
    final ProductDetailController detailController =
        Get.put(ProductDetailController(Rx<ProductCardModel>(product)));
    return ListTile(
      leading: Image(image: AssetImage(product.image)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: product.title,
                color: AppColors.black,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
              IconButton(
                icon: Icon(Icons.close, color: AppColors.secondarydarkGrey),
                onPressed: () {
                  cartController.removeFromCart(product);
                },
              ),
            ],
          ),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff7C7C7C),
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.stroke2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  detailController.decrement(product);
                  print( product.quantity);
                },
                icon: const Icon(Icons.remove, color: Color(0xff7c7c7c)),
              ),
              SizedBox(
                width: width(context, 15),
              ),
              Obx(()=> CustomText(
                text: '${product.quantity.value}',
                color: AppColors.secondarydarkGrey,
                fontSize: 16,
                weight: FontWeight.w900,
              ), ),
              
             
              SizedBox(
                width: width(context, 15),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.stroke2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  detailController.increment(product);
                     print( product.quantity);
                },
                icon: Icon(Icons.add, color: AppColors.primary),
              ),
            ],
          ),
          Obx(()=>    Text(
              ProductCardModel.numberFormat.format(product.price * product.quantity.value),
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff181725),
              fontWeight: FontWeight.bold,
            ),
          ),),
 
         
        ],
      ),
    );
  }
}
