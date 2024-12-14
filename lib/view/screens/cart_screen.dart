import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controllers/cart_controller.dart';
import 'package:minimandi/view/widget/cart_tile_widget.dart';
import 'package:minimandi/view/widget/custom_button.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          title: CustomText(
            text: 'My Cart',
            color: AppColors.black,
            fontSize: 17,
            weight: FontWeight.bold,
          ),
        ),
        body: Obx(
          () {
            if (cartController.isCartEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.shopping_cart,
                      color: AppColors.secondarydarkGrey,
                      size: 50,
                    ),
                  ),
                  sizedBoxheight(context),
                  Center(
                    child: CustomText(
                      text: 'Cart Is Empty',
                      color: AppColors.secondarydarkGrey,
                      fontSize: 22,
                      weight: FontWeight.w900,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Obx(
                    () => Expanded(
                      child: ListView.separated(
                        itemCount: cartController.cartProducts.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 2,
                          indent: 2,
                          thickness: 1,
                          color: AppColors.stroke2,
                        ),
                        itemBuilder: (context, index) {
                          final product = cartController.cartProducts[index] ;
                          return CartTileWidget(product: product);
                        },
                      ),
                    ),
                  ),
                  _buildCheckOutButton(context, cartController),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _buildCheckOutButton(context, CartController controller) {
  return controller.isCartEmpty
      ? const SizedBox.shrink()
      : CustomButton(
          text: 'CheckOut',
          onPressed: () {
            showCheckOutBottomSheet(context);
          },
          color: AppColors.primary);
}

void showCheckOutBottomSheet(dynamic context) {
  final CartController cartController = Get.find();
  showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17))),
            child: Padding(
              padding: only(context, left: 15, right: 15, top: 15),
              child: Column(
                children: [
                  _buildHeader(context),
                  const Divider(),
                  _buildDeliveryRow(context),
                  const Divider(),
                  _buildPaymentRow(context),
                  const Divider(),
                  _buildDiscountRow(context),
                  const Divider(),
                  _buildTotalCostRow(cartController, context),
                  const Divider(),
                  _buildTextRow(),
                  sizedBoxheight(context),
                  CustomButton(
                      text: 'Place Order',
                      onPressed: () {
                        cartController.placeOrder();
                      },
                      color: AppColors.primary)
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: 'Check Out',
        color: AppColors.black,
        fontSize: 19,
        weight: FontWeight.w900,
      ),
      IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.close),
      ),
    ],
  );
}

Widget _buildDeliveryRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
          text: 'Delivery', color: AppColors.secondarydarkGrey, fontSize: 17),
      Row(
        children: [
          CustomText(
            text: 'Select Method ',
            color: AppColors.black,
            fontSize: 15,
            weight: FontWeight.w900,
          ),
          sizedBoxWidth(context),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ],
  );
}

Widget _buildPaymentRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
          text: 'Payment', color: AppColors.secondarydarkGrey, fontSize: 17),
      Row(
        children: [
          Image.asset(Assets.visa),
          sizedBoxWidth(context),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ],
  );
}

Widget _buildDiscountRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
          text: 'Promo Code', color: AppColors.secondarydarkGrey, fontSize: 17),
      Row(
        children: [
          CustomText(
            text: 'Pick Discount',
            color: AppColors.black,
            fontSize: 15,
            weight: FontWeight.w900,
          ),
          sizedBoxWidth(context),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTotalCostRow(CartController cartController, BuildContext context) {
  final getTotal = cartController.calculateTotal();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
          text: 'Total Cost', color: AppColors.secondarydarkGrey, fontSize: 17),
      Row(
        children: [
          CustomText(
            text: '$getTotal',
            color: AppColors.black,
            fontSize: 15,
            weight: FontWeight.w900,
          ),
          sizedBoxWidth(context),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTextRow() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: RichText(
      text: TextSpan(
        text: 'By Placing an order you agree to our',
        style: TextStyle(
            color: AppColors.secondarydarkGrey,
            fontSize: 14,
            fontFamily: AppFonts.poppins),
        children: [
          TextSpan(
            text: '\nTerms and Conditions.',
            style: TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w900,
                fontFamily: AppFonts.poppins),
          ),
        ],
      ),
    ),
  );
}
