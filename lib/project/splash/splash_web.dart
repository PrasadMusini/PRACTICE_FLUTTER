import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_flutter/animations/effects/bottom_bounce_animation.dart';
import 'package:practice_flutter/practice/app_enterence/consts.dart';

class SplashWeb extends StatefulWidget {
  const SplashWeb({super.key});

  @override
  State<SplashWeb> createState() => _SplashWebState();
}

class _SplashWebState extends State<SplashWeb> {
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
      } else {}
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return const AnimationFromBottomToTop(
      beginScale: 300,
      delay: 2,
      child: Scaffold(
        body: Center(child: Text('Splash Screen')
            // BounceFromBottomAnimation(delay: 2, child: )

            /* SplashScaleAnimation(
          backgroundColor: Colors.red.shade400,
          beginScale: 0.0,
          endScale: 2.0,
          delay: 3,
          doneAnimation: (status) {
            if (status == AnimationStatus.completed) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BounceFromRightAnimation(
                          delay: 1,
                          child: _destinationScreenFuture,
                        )),
              );
            }
          },
          child: const Text('Splash Screen'),
        ) */

            ),
      ),
    );
  }
}
