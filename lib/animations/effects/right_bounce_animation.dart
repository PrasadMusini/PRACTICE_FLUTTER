import 'package:flutter/material.dart';

class BounceFromRightAnimation extends StatefulWidget {
  final Widget child;
  final double delay;
  const BounceFromRightAnimation(
      {super.key, required this.child, required this.delay});

  @override
  State<BounceFromRightAnimation> createState() =>
      _BounceFromRightAnimationState();
}

class _BounceFromRightAnimationState extends State<BounceFromRightAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
        // microseconds: (1500 * widget.durationInSeconds).round(),
        milliseconds: (1500 * widget.delay).round(),
      ),
      vsync: this,
    );

    final Animation<double> curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _animation = Tween<double>(begin: 100, end: 0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_animation.value, 0),
      child: widget.child,
    );
  }
}
