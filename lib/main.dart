import 'package:cosc30_midterm_caguco_set4/splashArt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorGame());
}

//CAGUCO, JOANNA MARIE COLOR GAME
class ColorGame extends StatelessWidget {
  const ColorGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //----> My SplashScreen Section <----//
        home: SplashScreen());
  }
}
