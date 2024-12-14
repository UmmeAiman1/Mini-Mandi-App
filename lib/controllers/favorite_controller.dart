import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/models/product_card_model.dart';

class FavoriteController extends GetxController {
  RxList<ProductCardModel> favorite = <ProductCardModel>[].obs;

 bool isFavorite(ProductCardModel product) {
    return favorite.contains(product);
  }

  void addTofav(ProductCardModel product){
      if (!favorite.contains(product)) {
      favorite.add(product);
      Get.snackbar('Item Added', '${product.title} has been added to favorites',  snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.primary.withOpacity(0.6),
        colorText: AppColors.white,
        snackStyle: SnackStyle.FLOATING);
    }
  }

  void removeFromFav(ProductCardModel product){
    favorite.remove(product);
Get.snackbar('Item Removed', '${product.title} has been removed from favorites',  snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.primary.withOpacity(0.6),
        colorText: AppColors.white,
        snackStyle: SnackStyle.FLOATING);
  }

   bool get isFavoriteEmpty => favorite.isEmpty;

}