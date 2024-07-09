import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_flutter/animations/effects/right_bounce_animation.dart';
import 'package:practice_flutter/animations/effects/splash_scale_animation.dart';
import 'package:practice_flutter/project/common_utilities/shared_prefs.dart';
import 'package:practice_flutter/project/main_screen/main_screen_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/home_page/home_mobile.dart';
import 'package:practice_flutter/project/onboarding/onboarding_mobile.dart';
import 'package:practice_flutter/project/signin/signin_mobile.dart';

class SplashMobile extends StatefulWidget {
  const SplashMobile({super.key});

  @override
  State<SplashMobile> createState() => _SplashMobileState();
}

class _SplashMobileState extends State<SplashMobile> {
  late Widget _destinationScreenFuture;

  @override
  void initState() {
    super.initState();
    _checkVisited();
  }

  Future<void> _checkVisited() async {
    bool visited = await SharedPrefsHelper.getVisitStatus();

    if (visited) {
      bool loggedIn = await SharedPrefsHelper.getLoginStatus();
      if (loggedIn) {
        _destinationScreenFuture = const HomeMobile();
      } else {
        _destinationScreenFuture = const SigninMobile();
      }
    } else {
      _destinationScreenFuture = const OnboardingMobile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimationSplashScale(
        backgroundColor: Colors.red.shade400,
        beginScale: 0.0,
        endScale: 2.0,
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
          }
        },
        child: const Text('Splash Screen'),
      )),
    );
  }
}
