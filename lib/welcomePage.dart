import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colorGambleGame.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _backgroundAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust the duration as needed
    );

    _backgroundAnimation = _controller.drive(
      ColorTween(
        begin: Color.fromARGB(255, 134, 122, 222),
        end: Color.fromARGB(255, 231, 50, 4),
      ),
    );

    _controller.repeat(
        reverse:
            true); // Reversing the animation to smoothly transition back and forth

    // Uncomment the line below if you want to start the animation immediately when the screen is loaded
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _backgroundAnimation.value!,
                  Color.fromARGB(
                      255, 157, 0, 255), // You can set another color if needed
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ColorGambleGame()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/play.png',
                      width: 200,
                      height: 130,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      SystemNavigator.pop();
                    },
                    child: Image.asset(
                      'assets/images/exit.png',
                      width: 150,
                      height: 75,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
