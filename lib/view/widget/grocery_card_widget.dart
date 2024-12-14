import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_styling.dart';

import 'package:minimandi/view/widget/custom_text.dart';

class GroceryCardWidget extends StatelessWidget {
  final String image;
  final Color color;
final String title;
  const GroceryCardWidget({super.key, required this.color, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: only(context, right: 10,),
     child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(17)),
              height: height(context, 70),
              width: width(context, 165),
              child: Row(
                children: [
                  Image.asset(image),
                  SizedBox(
                    width: width(context, 10),
                  ),
                  CustomText(
                    text: title,
                    color: AppColors.black,
                    fontSize: 16,
                    weight: FontWeight.w900,
                    fontFamily: AppFonts.poppins,
                  ),
                ],
              ),
            ),
   );
      
      
}}
