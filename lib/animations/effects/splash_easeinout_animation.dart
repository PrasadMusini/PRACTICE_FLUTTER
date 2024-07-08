import 'package:flutter/material.dart';

class AnimationSplashEaseInOut extends StatefulWidget {
  final Widget child;
  final double delay;
  final double beginScale;
  final double endScale;
  final void Function(AnimationStatus)? doneAnimation;
  const AnimationSplashEaseInOut({
    super.key,
    required this.child,
    required this.delay,
    this.beginScale = 1.0,
    this.endScale = 10.0,
    this.doneAnimation,
  });

  @override
  State<AnimationSplashEaseInOut> createState() =>
      _AnimationSplashEaseInOutState();
}

class _AnimationSplashEaseInOutState extends State<AnimationSplashEaseInOut>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward().then((_) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _animation = Tween<double>(begin: 1, end: 2000).animate(_controller);
          _controller.forward(from: 0);
        });
      });
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
      backgroundColor: Colors.red[400],
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
