import 'package:flutter/material.dart';
import 'package:furniture_app/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(
          'furniture.',
          style: TextStyle(
              fontFamily: 'Gelasio',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black),
        ),
      ),
    );
  }
}
