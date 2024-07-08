// fade_route.dart
import 'package:flutter/material.dart';

class NavigateWithFadeAnimation extends PageRouteBuilder {
  final Widget page;
  NavigateWithFadeAnimation({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration:
              const Duration(milliseconds: 700), // Set the duration to 1 second
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
