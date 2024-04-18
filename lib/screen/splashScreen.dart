import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../auth/main_page.dart';
import 'Onboarding.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey.shade300, // Background color
      child: AnimatedSplashScreen(
        duration: 6000,
        splash: Stack(
          children: [
            Container(
              color: Colors.grey.shade300, // Background color
              child: Center(
                child: Lottie.asset(
                  "assets/Lottie/Animation.json",
                  repeat: true,
                  width: MediaQuery.of(context).size.width * 0.6, // Adjust width as needed
                  height: MediaQuery.of(context).size.width * 0.6, // Adjust height as needed
                ),
              ),
            ),
          ],
        ),
        nextScreen: const OnboardingPage(),
        splashIconSize: 400,
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
