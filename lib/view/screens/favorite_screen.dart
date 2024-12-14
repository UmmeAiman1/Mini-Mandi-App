import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/controllers/favorite_controller.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoriteController favController = Get.put(FavoriteController());
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Favorite',
            color: AppColors.black,
            fontSize: 17,
            weight: FontWeight.bold,
          ),
        ),
        body: Obx(() {
          if (favController.isFavoriteEmpty) {
            return _buildEmptyFav(context);
          } else {
            return _buildFavList(favController);
          }
        }),
      ),
    );
  }
}

Widget _buildEmptyFav(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
          child: Icon(
        Icons.favorite_outline,
        size: 45,
        color: AppColors.secondarydarkGrey,
      )),
      sizedBoxheight(context),
      CustomText(
        text: 'No Favorites Yet',
        color: AppColors.secondarydarkGrey,
        fontSize: 22,
        weight: FontWeight.w900,
      )
    ],
  );
}

Widget _buildFavList(FavoriteController favController) {

  if (favController.favorite.isEmpty) {
    return const Center(
      child:
          CircularProgressIndicator(), 
    );
  }

  return ListView.separated(
    itemCount: favController.favorite.length,
    itemBuilder: (context, index) {
      final product = favController.favorite[index];
      return ListTile(
        leading: Image.asset(product.image),
        title: CustomText(
          text: product.title,
          color: AppColors.primaryText,
          fontSize: 18,
        ),
        subtitle: CustomText(
          text: product.description,
          color: AppColors.secondarydarkGrey,
          fontSize: 16,
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: product.formattedPrice,
              color: AppColors.primaryText,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
            sizedBoxWidth(context),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => Divider(
      height: 2,
      indent: 2,
      thickness: 1,
      color: AppColors.stroke2,
    ),
  );
}
