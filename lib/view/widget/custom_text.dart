import 'package:flutter/material.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_styling.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  final Color color;
  final double fontSize;
  final FontWeight? weight;

  const CustomText(
      {super.key,
      required this.text,
      this.fontFamily,
      this.textAlign,
      required this.color,
      required this.fontSize,  this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, 
      fontSize: f(context, fontSize),
      fontFamily: AppFonts.poppins,
      fontWeight: weight
      ),
    );
  }
}
