import 'package:get/get.dart';


class FilterController extends GetxController {
  RxList<String> selectedCategories = <String>[].obs;
  RxList<String> selectedBrands = <String>[].obs;


  List<String> categories = ['Eggs', 'Noodles and Pasta', 'Chips and Crisps', 'Fast Food'];
  List<String> brands = ['Individual Collection', 'Coca Cola', 'Nirala Bakers', 'Butt Sweets'];

  
  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }


  void toggleBrand(String brand) {
    if (selectedBrands.contains(brand)) {
      selectedBrands.remove(brand);
    } else {
      selectedBrands.add(brand);
    }
  }

 
}
