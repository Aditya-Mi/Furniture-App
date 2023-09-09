import 'package:flutter/material.dart';
import 'package:furniture_app/on_boarding_screen.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? onBoarding;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  onBoarding = prefs.getBool('onBoarding');
  onBoarding ??= true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home:
          onBoarding! == true ? const OnBoardingScreen() : const LoginScreen(),
    );
  }
}
