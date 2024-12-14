import 'package:get/get.dart';
import 'package:minimandi/data/product_card_details.dart';
import 'package:minimandi/models/product_card_model.dart';

class HomeController extends GetxController {
  var filteredProducts = <ProductCardModel>[].obs;

  void filterByCategory(String category) {
    filteredProducts.value =
        ProductCardDetails().getProductsByCategory(category);
  }
}
