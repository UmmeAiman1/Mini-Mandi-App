import 'package:get/get.dart';
import 'package:minimandi/models/product_card_model.dart';

class ProductDetailController extends GetxController {
 Rx<ProductCardModel> product;
 
  ProductDetailController(this.product);


 increment(ProductCardModel product) {
  product.quantity.value++;

}

void decrement(ProductCardModel product) {
  if (product.quantity > 1) {
    product.quantity.value--;

  }
}
}