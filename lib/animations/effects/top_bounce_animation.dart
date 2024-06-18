import 'package:flutter/material.dart';

class BounceFromTopAnimation extends StatefulWidget {
  final double delay;
  final Widget child;
  const BounceFromTopAnimation(
      {super.key, required this.delay, required this.child});

  @override
  State<BounceFromTopAnimation> createState() => _BounceFromTopAnimationState();
}

class _BounceFromTopAnimationState extends State<BounceFromTopAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (1500 * widget.delay).round(),
      ),
    );

    Animation<double> curve =
        CurvedAnimation(curve: Curves.easeOutCubic, parent: _controller);

    _animation = Tween<double>(begin: -100, end: 0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _animation.value),
      child: widget.child,
    );
  }
}
