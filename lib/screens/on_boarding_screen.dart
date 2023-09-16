import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/auth/ui/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/on_boarding_image.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            left: MediaQuery.of(context).size.width * 0.08,
            child: const Text(
              'MAKE YOUR',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Gelasio',
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 96, 96, 96),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            left: MediaQuery.of(context).size.width * 0.08,
            child: const Text(
              'HOME BEAUTIFUL',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Gelasio',
                  fontWeight: FontWeight.w700),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.76,
              child: const Text(
                'The best simple place where you discover most wonderful furnitures and make your home beautiful',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'NunitoSans',
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.64),
            child: CustomButton(
              function: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onBoarding', false);
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              },
              text: 'Get Started',
              height: 54,
              width: 159,
              fontFamily: 'Gelasio',
            ),
          ),
        ],
      ),
    );
  }
}
