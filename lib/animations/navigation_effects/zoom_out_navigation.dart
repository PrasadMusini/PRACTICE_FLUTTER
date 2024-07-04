import 'package:flutter/material.dart';

class ZoomOutRoute extends PageRouteBuilder {
  final Widget page;
  ZoomOutRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration:
              const Duration(seconds: 1), // Set the duration to 1 second
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 1.5, end: 1.0).animate(
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
