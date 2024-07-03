import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice_flutter/practice/app_enterence/consts.dart';
import 'package:practice_flutter/practice/app_enterence/home_screen.dart';
import 'package:practice_flutter/practice/app_enterence/onboarding_screen.dart';
import 'package:practice_flutter/practice/app_enterence/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _checkVisited);
  }

  _checkVisited() async {
    bool visited = await SharedPreferencesHelper.getVisited();

    if (visited) {
      bool loggedIn = await SharedPreferencesHelper.getLoggedIn();
      if (loggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
