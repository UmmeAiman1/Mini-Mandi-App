import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/data/profile_tile_details.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class ProfileTileWidget extends StatelessWidget {
final  VoidCallback onTap;
  const ProfileTileWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final profileTileDetails = ProfileTileDetails();
    return Expanded(
      child: ListView.builder(
        itemCount: profileTileDetails.profileTileData.length,
        itemBuilder: (context, index) {
          final tileData = profileTileDetails.profileTileData[index];
          return Column(
            children: [
             const Divider(),
              InkWell(
                onTap: onTap ,
                child: ListTile(
                  
                  leading: Image.asset(tileData.image),
                  title: CustomText(
                    text: tileData.title,
                    color: AppColors.darkText,
                    fontSize: 17,
                    weight: FontWeight.w900,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkText,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
