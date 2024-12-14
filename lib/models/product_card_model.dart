import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductCardModel {
  final String id;
  final String title;
  final String description;

  final double price;
  final String image;
  Rx<int> quantity;
  final String category;
  static final NumberFormat numberFormat =
      NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 2);
  ProductCardModel({
    required this.category,
    required int quantity,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  }) : quantity = Rx<int>(quantity);

  String get formattedPrice {
    return numberFormat.format(price);
  }

  factory ProductCardModel.fromJson(Map<String, dynamic> json) {
    return ProductCardModel(
      quantity: json['quantity'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] is String)
          ? double.parse(json['price'])
          : json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity.value,
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category
    };
  }
}
