import 'package:flutter/material.dart';

class AnimationSplashScale extends StatefulWidget {
  final Widget child;
  final double delay;
  final double beginScale;
  final double endScale;
  final Color? backgroundColor;
  final void Function(AnimationStatus)? doneAnimation;

  const AnimationSplashScale({
    super.key,
    required this.child,
    required this.delay,
    this.beginScale = 1.0,
    this.endScale = 10.0,
    this.backgroundColor,
    this.doneAnimation,
  });

  @override
  State<AnimationSplashScale> createState() => _AnimationSplashScaleState();
}

class _AnimationSplashScaleState extends State<AnimationSplashScale>
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

    _controller
        .addStatusListener((status) => widget.doneAnimation?.call(status));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
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
