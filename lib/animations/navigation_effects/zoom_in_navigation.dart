// zoom_route.dart
import 'package:flutter/material.dart';

class NavigateWithZoomInAnimation extends PageRouteBuilder {
  final Widget page;
  NavigateWithZoomInAnimation({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration:
              const Duration(milliseconds: 700), // Set the duration to 1 second
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        );
}
