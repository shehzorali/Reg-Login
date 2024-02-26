import 'package:flutter/material.dart';
import 'package:saib_app/Screens/LandingPage.dart';
import 'package:saib_app/Screens/Registration_Screen.dart';
import 'package:get/get.dart';
import 'package:saib_app/Screens/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User Registration App',
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => RegisterScreen()),
        GetPage(name: '/landing', page: () => const LandingPage()),
        GetPage(name: '/login', page: () => const LandingPage()),
      ],
    );
  }
}



