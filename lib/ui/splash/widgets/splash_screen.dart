import 'package:flutter/material.dart';

const _splashImagePath = "assets/images/splash.png";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset(_splashImagePath));
  }
}
