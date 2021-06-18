import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sound_kit/screens/loginScreen.dart';
import 'package:sound_kit/utils/constants.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Text('Sound Master', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)
        ),
        nextScreen: Login(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        backgroundColor: kPrimaryColor
    );
  }
}
