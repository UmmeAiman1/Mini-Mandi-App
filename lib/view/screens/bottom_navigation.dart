import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/constants/app_colors.dart';
import 'package:minimandi/controllers/bottom_navigation_controller.dart';
import 'package:minimandi/view/screens/cart_screen.dart';
import 'package:minimandi/view/screens/explore_screen.dart';
import 'package:minimandi/view/screens/favorite_screen.dart';
import 'package:minimandi/view/screens/home_screen.dart';
import 'package:minimandi/view/screens/profile_screeen.dart';


class BottomNavigation extends StatelessWidget {
   BottomNavigation({super.key});
    final  List<Widget> screens = [
      HomeScreen(),
    const ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    const ProfileScreeen()
  
  ];

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: bottomNavigationController.currentIndex.value, children: screens),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
         showUnselectedLabels: true,
         
          
          unselectedItemColor: AppColors.secondarydarkGrey,
          unselectedLabelStyle: TextStyle(color: AppColors.secondarydarkGrey),
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: TextStyle(color: AppColors.primary,),
          currentIndex: bottomNavigationController.currentIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              label: 'Shop',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined, ),
              label: 'Explore',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favourite',
            ),
             BottomNavigationBarItem(
              
              icon: Icon(Icons.person_outline),
              label: 'Account',
              
            ),
          ],
          onTap: (index) {
            bottomNavigationController.onChangeIndex(index);
            
          },
        ),
      ),
    );
  }
}