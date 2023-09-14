import 'package:flutter/material.dart';
import 'package:furniture_app/providers/auth_provider.dart';
import 'package:furniture_app/screens/on_boarding_screen.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:furniture_app/screens/main_screen.dart';
import 'package:furniture_app/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

bool? onBoarding;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  onBoarding = prefs.getBool('onBoarding');
  onBoarding ??= true;
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: onBoarding! == true
            ? const OnBoardingScreen()
            : authState.when(
                data: (user) {
                  if (user != null) {
                    return const MainScreen();
                  }
                  return const LoginScreen();
                },
                error: (error, stackTrace) {
                  return const LoginScreen();
                },
                loading: () => const SplashScreen()));
  }
}
