import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/animations/effects/splash_scale_animation.dart';
import 'package:practice_flutter/project/common_utilities/shared_prefs.dart';
import 'package:practice_flutter/project/navigation/router.dart';

class SplashMobile extends StatefulWidget {
  const SplashMobile({super.key});

  @override
  State<SplashMobile> createState() => _SplashMobileState();
}

class _SplashMobileState extends State<SplashMobile> {
  late String _destinationScreenFuture;

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
        _destinationScreenFuture = Routes.screenHome.path;
      } else {
        _destinationScreenFuture = Routes.screenSignin.path;
      }
    } else {
      _destinationScreenFuture = Routes.screenOnBoarding.path;
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
            /* Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => _destinationScreenFuture),
            ); */
            // context.pushReplacement(_destinationScreenFuture);
            context.go(_destinationScreenFuture);
          }
        },
        child: const Text('Splash Screen'),
      )),
    );
  }
}
