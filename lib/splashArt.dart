import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'loginPage.dart'; // LoginPage

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.deepPurple.shade200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                'Color Game Gambling',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.decoratedBoxTransition,
        backgroundColor: Color.fromARGB(255, 255, 255, 255));
  }
}
