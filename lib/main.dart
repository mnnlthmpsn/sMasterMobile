import 'package:flutter/material.dart';
import 'package:sound_kit/screens/splashScreen.dart';
import 'package:sound_kit/utils/constants.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sound Filter',
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
    home: SplashScreen(),
  ));
}
