import 'package:flutter/material.dart';

import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_styling.dart';
import 'package:minimandi/view/widget/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final String? image;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: symmetric(context, horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width(context, 400), height(context, 55)),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed:onPressed,
        child: image != null ? Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(image!),
             SizedBox(
              width: width(context, 15),
            ),
            CustomText(
              text: text,
              color: const Color(0xFFF5F5F6),
              fontSize: 18,
              weight: FontWeight.normal,
              fontFamily: AppFonts.poppins,
            ),
          ],
        ) :  CustomText(
              text:text,
              color: const Color(0xFFF5F5F6),
              fontSize: 18,
              weight: FontWeight.normal,
              fontFamily: AppFonts.poppins,
            ),
        
      ),
    );
  }
}
