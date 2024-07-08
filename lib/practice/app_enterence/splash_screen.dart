import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_flutter/animations/effects/right_bounce_animation.dart';
import 'package:practice_flutter/animations/effects/splash_scale_animation.dart';
import 'package:practice_flutter/practice/app_enterence/consts.dart';
import 'package:practice_flutter/practice/app_enterence/home_screen.dart';
import 'package:practice_flutter/practice/app_enterence/login_screen.dart';
import 'package:practice_flutter/practice/practice_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Widget _destinationScreenFuture;

  @override
  void initState() {
    super.initState();
    _checkVisited();
  }

  Future<void> _checkVisited() async {
    bool visited = await SharedPreferencesHelper.getVisited();

    if (visited) {
      bool loggedIn = await SharedPreferencesHelper.getLoggedIn();
      if (loggedIn) {
        _destinationScreenFuture = const HomeScreen();
      } else {
        _destinationScreenFuture = const LoginScreen();
      }
    } else {
      _destinationScreenFuture = const PracticeUI();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimationSplashScale(
        endScale: 800.0,
        delay: 3,
        doneAnimation: (status) {
          if (status == AnimationStatus.completed) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AnimationFromRightToLeft(
                        delay: 1,
                        child: _destinationScreenFuture,
                      )),
            );

            // FadeRoute(page: _destinationScreenFuture);
          }
        },
        child: const Text('Splash Screen'),
      )),
    );
  }
}
