import 'package:flutter/material.dart';

import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/constants/app_fonts.dart';
import 'package:minimandi/constants/app_styling.dart';

import 'package:minimandi/view/widget/custom_text.dart';
import 'package:minimandi/view/widget/explore_card_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: CustomText(
            text: 'Find Products',
            color: AppColors.black,
            fontSize: 22,
            weight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: only(context, left: 25, right: 25),
          child: Column(
            children: [
              _buildSearchBar(context),
              const SizedBox(
                height: 20,
              ),
              const ExploreCardWidget()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSearchBar(BuildContext context) {
  return SearchBar(
    leading: Padding(
      padding: only(context, left: 10, right: 8),
      child: const Icon(Icons.search_outlined),
    ),
    hintText: 'Search Store',
    hintStyle: WidgetStatePropertyAll(
      TextStyle(fontFamily: AppFonts.poppins),
    ),
    elevation: const WidgetStatePropertyAll<double>(0),
    shape: const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(17),
        ),
      ),
    ),
  );
}
