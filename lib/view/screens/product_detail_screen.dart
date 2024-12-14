import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';

import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controllers/favorite_controller.dart';
import 'package:minimandi/controllers/product_detail_controller.dart';
import 'package:minimandi/models/product_card_model.dart';
import 'package:minimandi/controllers/cart_controller.dart';

import 'package:minimandi/view/widget/custom_button.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class ProductDetailScreen extends StatelessWidget {
  final CartController cartController = Get.find();
  final FavoriteController favController = Get.find();
  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductCardModel product = Get.arguments;
    final ProductDetailController controller =
        Get.put(ProductDetailController(Rx<ProductCardModel>(product)));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _buildProductContainer(context, product),
          _buildProductDetails(context, controller, product, favController),
          _buildProductReviews(context, product),
          sizedBoxheight(context),
          _buildAddToCartButton(cartController, product),
        ],
      ),
    );
  }
}

Widget _buildProductContainer(BuildContext context, ProductCardModel products) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.stroke2,
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(27), bottomLeft: Radius.circular(27)),
    ),
    height: height(context, 325),
    width: double.infinity,
    child: Padding(
      padding: only(context, left: 15, right: 15, top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: AppColors.darkText,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.ios_share_rounded,
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              products.image,
              fit: BoxFit.fill,
              height: height(context, 250),
              width: width(context, double.infinity),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildProductDetails(
    BuildContext context,
    ProductDetailController controller,
    ProductCardModel product,
    FavoriteController favController) {
  return Padding(
    padding: only(context, left: 15, right: 15, top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: product.title,
                color: AppColors.black,
                fontSize: 20,
                weight: FontWeight.w900,
              ),
              Obx(
                () => IconButton(
                  onPressed: () {
                    favController.isFavorite(product)
                        ? favController.removeFromFav(product)
                        : favController.addTofav(product);
                  },
                  icon: Icon(
                    favController.isFavorite(product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favController.isFavorite(product)
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomText(
            text: product.description,
            color: AppColors.secondarydarkGrey,
            fontSize: 17),
        SizedBox(
          height: height(context, 10),
        ),
        Row(
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
                    controller.decrement(product);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: AppColors.secondarydarkGrey,
                  ),
                ),
                SizedBox(
                  height: height(context, 13),
                  width: width(context, 10),
                ),
                Obx(
                  () => CustomText(
                    text: '${product.quantity.value}',
                    color: AppColors.primaryText,
                    fontSize: 15,
                    weight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: height(context, 13),
                  width: width(context, 10),
                ),
                IconButton(
                  iconSize: 26,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.stroke2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    controller.increment(product);
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Obx(
              () => Text(
                ProductCardModel.numberFormat
                    .format(product.price * product.quantity.value),
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff181725),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildProductReviews(BuildContext context, ProductCardModel products) {
  return Padding(
    padding: only(context, left: 14, right: 15, top: 10),
    child: Column(
      children: [
        Divider(
          color: AppColors.stroke2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Product Details',
              color: AppColors.black,
              fontSize: 18,
              weight: FontWeight.w900,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
            ),
          ],
        ),
        CustomText(
            text:
                '${products.title} are nutritious. ${products.title} may be good for weight loss.${products.title} may be good for your heart. As part of a healthy and varied diet.',
            color: AppColors.secondarydarkGrey,
            fontSize: 14),
        sizedBoxheight(context),
        Divider(
          color: AppColors.stroke2,
        ),
        sizedBoxheight(
          context,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Nutritions',
              color: AppColors.black,
              fontSize: 18,
              weight: FontWeight.w900,
            ),
            Row(
              children: [
                sizedBoxWidth(context),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.stroke2,
                  ),
                  padding: all(context, 4),
                  child: const Text(
                    '100g',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                sizedBoxWidth(context),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
        sizedBoxheight(context),
        Divider(
          color: AppColors.stroke2,
        ),
        sizedBoxheight(
          context,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Reviews',
              color: AppColors.black,
              fontSize: 18,
              weight: FontWeight.w900,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.star_sharp,
                  color: Color(0xffF3603F),
                  size: 16,
                ),
                Icon(
                  Icons.star_sharp,
                  color: Color(0xffF3603F),
                  size: 16,
                ),
                Icon(
                  Icons.star_sharp,
                  color: Color(0xffF3603F),
                  size: 16,
                ),
                Icon(
                  Icons.star_sharp,
                  color: Color(0xffF3603F),
                  size: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.star_sharp,
                    color: Color(0xffF3603F),
                    size: 16,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildAddToCartButton(
    CartController cartController, ProductCardModel products) {
  return CustomButton(
      text: 'Add To Cart',
      onPressed: () {
        cartController.addToCart(products);
      },
      color: AppColors.primary);
}
