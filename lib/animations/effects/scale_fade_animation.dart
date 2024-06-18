import 'package:flutter/material.dart';

class ScaleFadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;
  const ScaleFadeAnimation(
      {super.key, required this.delay, required this.child});

  @override
  State<ScaleFadeAnimation> createState() => _ScaleFadeAnimationState();
}

class _ScaleFadeAnimationState extends State<ScaleFadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (500 * widget.delay).round(),
      ),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
          ..addListener(() {
            setState(() {});
          }));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    )..addListener(() {
        setState(() {});
      }));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _scaleAnimation.value,
      child: Opacity(
        opacity: _animation.value,
        child: widget.child,
      ),
    );
  }
}
