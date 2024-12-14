import 'dart:convert';

import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/models/product_card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  RxList<ProductCardModel> cartProducts = <ProductCardModel>[].obs;
  RxDouble total = 0.0.obs;

  @override
  void onInit() {
    loadcart();
    super.onInit();
  }

  Future<void> savecartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = cartProducts.map((item) => item.toJson()).toList();
    await prefs.setString('cart', jsonEncode(cartData));
  }

  Future<void> loadcart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart');
    if (cartData != null) {
      final List decodedData = jsonDecode(cartData);
      cartProducts.value =
          decodedData.map((e) => ProductCardModel.fromJson(e)).toList();
    }
  }

  Future<void> addToCart(ProductCardModel product) async {
    int index = cartProducts.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      cartProducts[index].quantity.value++;
    } else {
      cartProducts.add(product);
    }
    update();
    Get.snackbar('Item Added', '${product.title} has been added to cart',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.primary.withOpacity(0.6),
        colorText: AppColors.white,
        snackStyle: SnackStyle.FLOATING);
    await savecartItems();
  }

  Future<void> removeFromCart(ProductCardModel product) async {
    cartProducts.removeWhere((item) => item.id == product.id);
    Get.snackbar('Item Removed', '${product.title} has been removed from cart',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.primary.withOpacity(0.6),
        colorText: AppColors.white,
        snackStyle: SnackStyle.FLOATING);
    await savecartItems();
  }

  Future<void> clearCartFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
  }

  double calculateTotal() {
    for (var item in cartProducts) {
      total.value += item.price * item.quantity.value;
    }
    return total.value;
  }

  Future<void> placeOrder() async {
    Get.offAllNamed(AppLinks.order);
    await clearCartFromSharedPref();
    cartProducts.clear();
  }

  bool get isCartEmpty => cartProducts.isEmpty;
}
