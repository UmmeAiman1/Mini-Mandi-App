
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/models/profile_tile_model.dart';

class ProfileTileDetails {
  final profileTileData = [
   ProfileTileModel(image: Assets.orders, title: 'Orders'),
   ProfileTileModel(image: Assets.details, title: 'My Details'),
   ProfileTileModel(image: Assets.address, title: 'Delivery Address'),
   ProfileTileModel(image: Assets.payment, title: 'Payment Methods'),
   ProfileTileModel(image: Assets.promo, title: 'Promo Code'),
   ProfileTileModel(image: Assets.bell, title: 'Notifications'),
   ProfileTileModel(image: Assets.help, title: 'Help'),
   ProfileTileModel(image: Assets.about, title: 'About'),

  ];
}