import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_images.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/custom_text.dart';
import 'package:minimandi/view/widget/profile_tile_widget.dart';

class ProfileScreeen extends StatelessWidget {
  const ProfileScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: only(context, left: 20, right: 20, top: 30),
          child: Column(
            children: [
              _buildprofileheader(context),
              SizedBox(
                height: height(context, 15),
              ),
              ProfileTileWidget(
                onTap: () {},
              ),
              SizedBox(
                height: height(context, 15),
              ),
              _buildLogOutButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildprofileheader(BuildContext context) {
  return Row(
    children: [
      CircleAvatar(
        radius: height(context, 30),
        backgroundColor: AppColors.stroke,
        child: Icon(
          Icons.person,
          size: height(context, 30),
        ),
      ),
      SizedBox(
        width: width(context, 30),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Sabry',
            color: AppColors.black,
            fontSize: 19,
            weight: FontWeight.w900,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: 'example@gmail.com',
                  color: AppColors.secondarydarkGrey,
                  fontSize: 13),
              SizedBox(
                width: width(context, 60),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ],
      )
    ],
  );
}

Widget _buildLogOutButton(BuildContext context) {
  return SizedBox(
    height: height(context, 55),
    child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.logout),
            SizedBox(
              width: width(context, 10),
            ),
            CustomText(
              text: 'Log Out',
              color: AppColors.primary,
              fontSize: 16,
              weight: FontWeight.bold,
            )
          ],
        )),
  );
}
