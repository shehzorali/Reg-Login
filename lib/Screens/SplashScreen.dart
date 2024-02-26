
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LandingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(); // Repeat the animation

    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    // Simulate a delay (e.g., loading resources or checking user authentication)
    await Future.delayed(const Duration(seconds: 10));

    // Stop the rotation animation
    _controller.stop();

    // Navigate to the main landing page
    Get.offAll(const LandingPage());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            fit: StackFit.expand,

            children: [
              Image.asset(
                'assets/bg_landing.png',
                fit: BoxFit.cover,),
              Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    RotationTransition(
                      turns: _rotationAnimation,
                      child: Image.asset(
                        'assets/logo_saib.png',
                        width: 250.0, // Adjust the width as needed
                        height: 250.0, // Adjust the height as needed
                      ),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
}
