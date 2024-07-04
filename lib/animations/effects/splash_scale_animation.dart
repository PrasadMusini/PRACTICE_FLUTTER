import 'package:flutter/material.dart';

class ScaleSplashScreen extends StatefulWidget {
  final Widget child;
  // final Widget destinationScreen;
  final double delay;
  final double beginScale;
  final double endScale;
  final void Function(AnimationStatus)? doneAnimation;

  const ScaleSplashScreen({
    super.key,
    required this.child,
    required this.delay,
    this.beginScale = 1.0,
    this.endScale = 10.0,
    this.doneAnimation,
  });

  @override
  State<ScaleSplashScreen> createState() => _ScaleSplashScreenState();
}

class _ScaleSplashScreenState extends State<ScaleSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.delay.toInt()),
      vsync: this,
    );

    _animation =
        Tween<double>(begin: widget.beginScale, end: widget.endScale).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 700), () {
      _controller.forward();
    });

    _controller.addStatusListener((status) => widget.doneAnimation?.call(status)

        /* {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => widget.destinationScreen),
        );
      }
    } */
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}
