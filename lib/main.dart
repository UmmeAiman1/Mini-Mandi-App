import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/view/bindings/bindings.dart';
import 'package:minimandi/view/screens/splash_screen.dart';

import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
     themeMode: ThemeMode.light,
      initialRoute: AppLinks.splash,
     getPages: AppRoutes.pages,
      home:  const SplashScreen(),
    );
  }
}