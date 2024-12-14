
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/models/product_card_model.dart';



class ProductCardDetails {

 final List<ProductCardModel> allProducts = [
    ProductCardModel(
        quantity: 1,
        title: 'Apple',
        description: '1 Kg, Red',
        price: 4.9,
        image: Assets.apple2,
        id: '1',
        category: 'Exclusive Offer'),
    ProductCardModel(
        quantity: 1,
        title: 'Banana',
        description: '12pcs, Organic',
        price: 2.6,
        image: Assets.banana,
        id: '2',
        category: 'Exclusive Offer'),
    ProductCardModel(
        quantity: 1,
        title: 'Red Mirch',
        description: '1kg, Shimla',
        price: 3.0,
        image: Assets.bellpepepr,
        id: '3',
        category: 'Best Selling'),
    ProductCardModel(
        quantity: 1,
        title: 'Ginger',
        description: '250gm, Organic',
        price: 1.06,
        image: Assets.ginger,
        id: '4',
        category: 'Best Selling'),
    ProductCardModel(
        quantity: 1,
        title: 'Beef Bone',
        description: '1kg, Fresh',
        price: 2.1,
        image: Assets.meat,
        id: '5',
        category: 'Groceries'),
    ProductCardModel(
        quantity: 1,
        title: 'Chicken',
        description: '1kg, Broiler',
        price: 2.9,
        image: Assets.chicken,
        id: '6',
        category: 'Groceries'),
    ProductCardModel(
        quantity: 1,
        title: 'Coke',
        description: '335ml,Diet',
        price: 1.99,
        image: Assets.coke,
        id: '7',
        category: 'Beverages'),
    ProductCardModel(
        quantity: 1,
        title: 'Sprite',
        description: '335ml,Flavored',
        price: 1.79,
        image: Assets.sprite,
        id: '8',
        category: 'Beverages'),
    ProductCardModel(
        quantity: 1,
        title: 'Apple Juice',
        description: '2L,Fresh',
        price: 15.99,
        image: Assets.ajuice,
        id: '9',
        category: 'Beverages'),
    ProductCardModel(
        quantity: 1,
        title: 'Orange Juice',
        description: '2L,Fresh',
        price: 13.39,
        image: Assets.ojuice,
        id: '10',
        category: 'Beverages'),
    ProductCardModel(
        quantity: 1,
        title: 'Pepsi',
        description: '250ml,Flavored',
        price: 1.79,
        image: Assets.pepsi,
        id: '11',
        category: 'Beverages'),
    ProductCardModel(
        quantity: 1,
        title: 'Coca Cola',
        description: '250ml,Original',
        price: 1.79,
        image: Assets.cola,
        id: '12',
        category: 'Beverages'),
         ProductCardModel(
        quantity: 1,
        title: 'Eggs Chicken Red',
        description: '4pcs, Organic',
        price: 1.99,
        image: Assets.eggs,
        id: '13',
        category: 'Dairy & Eggs'),
          ProductCardModel(
        quantity: 1,
        title: 'Layers White egg',
        description: '4pcs, Farmed',
        price: 1.79,
        image: Assets.eggs2,
        id: '14',
        category: 'Dairy & Eggs'),
         ProductCardModel(
        quantity: 1,
        title: 'Egg Pasta',
        description: '30gm, Flavoured',
        price: 1.79,
        image: Assets.pasta,
        id: '15',
        category: 'Bakery & Snacks'),
         ProductCardModel(
        quantity: 1,
        title: 'Egg Noodles',
        description: '50gm, Flavoured',
        price: 7.49,
        image: Assets.noodles,
        id: '16',
        category: 'Bakery & Snacks'),
         ProductCardModel(
        quantity: 1,
        title: 'Mayonnaise',
        description: '350ml, Eggless',
        price: 1.79,
        image: Assets.mayo,
        id: '17',
        category: 'Bakery & Snacks'),
         ProductCardModel(
        quantity: 1,
        title: 'Egg Noodles',
        description: '50gm, Added Flavour',
        price: 1.79,
        image: Assets.knorr,
        id: '18',
        category: 'Bakery & Snacks'),
       
          ProductCardModel(
        quantity: 1,
        title: 'Apple',
        description: '1 Kg, Red',
        price: 4.9,
        image: Assets.apple2,
        id: '1',
        category:  'Fresh Fruits \n& Vegetables'),
    ProductCardModel(
        quantity: 1,
        title: 'Banana',
        description: '12pcs, Organic',
        price: 2.6,
        image: Assets.banana,
        id: '2',
        category:  'Fresh Fruits \n& Vegetables'),
    ProductCardModel(
        quantity: 1,
        title: 'Red Mirch',
        description: '1kg, Shimla',
        price: 3.0,
        image: Assets.bellpepepr,
        id: '3',
        category: 'Fresh Fruits \n& Vegetables'),
    ProductCardModel(
        quantity: 1,
        title: 'Ginger',
        description: '250gm, Organic',
        price: 1.06,
        image: Assets.ginger,
        id: '4',
        category: 'Fresh Fruits \n& Vegetables'),
         ProductCardModel(
        quantity: 1,
        title: 'Beef Bone',
        description: '1kg, Fresh',
        price: 2.1,
        image: Assets.meat,
        id: '5',
        category: 'Meat & Fish'),
    ProductCardModel(
        quantity: 1,
        title: 'Chicken',
        description: '1kg, Broiler',
        price: 2.9,
        image: Assets.chicken,
        id: '6',
        category: 'Meat & Fish'),
  ];    







 List<ProductCardModel> getProductsByCategory(String category) {

 
    return allProducts.where((product) => product.category == category).toList();
  }
}



