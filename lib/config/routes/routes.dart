import 'package:get/get.dart';
import 'package:minimandi/view/bindings/bindings.dart';
import 'package:minimandi/view/screens/sign_in_screen.dart';
import 'package:minimandi/view/screens/sign_up_screen.dart';
import 'package:minimandi/view/screens/bottom_navigation.dart';
import 'package:minimandi/view/screens/cart_screen.dart';
import 'package:minimandi/view/screens/category_product_screen.dart';
import 'package:minimandi/view/screens/explore_screen.dart';
import 'package:minimandi/view/screens/filter_screen.dart';
import 'package:minimandi/view/screens/favorite_screen.dart';
import 'package:minimandi/view/screens/home_screen.dart';
import 'package:minimandi/view/screens/product_detail_screen.dart';
import 'package:minimandi/view/screens/splash_screen.dart';
import 'package:minimandi/view/screens/location_screen.dart';
import 'package:minimandi/view/screens/login_screen.dart';

import 'package:minimandi/view/screens/onboarding_screen.dart';
import 'package:minimandi/view/screens/order_accepted_screen.dart';
import 'package:minimandi/view/screens/phone_auth_screen.dart';
import 'package:minimandi/view/screens/profile_screeen.dart';
import 'package:minimandi/view/screens/verification_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splash,
      page: () => const SplashScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.onBoarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppLinks.signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: AppLinks.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppLinks.phoneauth,
      page: () => const PhoneAuthScreen(),
    ),
    GetPage(
      name: AppLinks.verify,
      page: () => const VerificationScreen(),
    ),
    GetPage(
      name: AppLinks.locator,
      page: () => const LocationScreen(),
    ),
    GetPage(
      name: AppLinks.signup,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: AppLinks.bottomNavigation,
      page: () => BottomNavigation(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.home,
      page: () =>  HomeScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.profile,
      page: () => const ProfileScreeen(),
    ),
    GetPage(
      name: AppLinks.explore,
      page: () => const ExploreScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.beverage,
      binding: AppBindings(),
      page: () => CategoryProductScreen(category: '${Get.parameters['category']}'),
    ),
    GetPage(
      name: AppLinks.cart,
      page: () => CartScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.favorite,
      page: () =>  FavoriteScreen(),
        binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.detail,
      page: () => ProductDetailScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.filter,
      page: () => FilterScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppLinks.order,
      page: () => const OrderAcceptedScreen(),
      binding: AppBindings(),
    ),
  ];
}

class AppLinks {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const signIn = '/signIn';
  static const login = '/login';
  static const phoneauth = '/phoneauth';
  static const verify = '/verify';
  static const locator = '/locator';
  static const signup = '/signup';
  static const bottomNavigation = '/bottomNavigation';
  static const home = '/home';
  static const profile = '/profile';
  static const beverage = '/beverage';
  static const explore = '/explore';
  static const cart = '/cart';
  static const favorite = '/favorite';
  static const detail = '/detail';
  static const filter = '/filter';
  static const order = '/order';
}
