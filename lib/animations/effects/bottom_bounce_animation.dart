import 'package:flutter/material.dart';

class BounceFromBottomAnimation extends StatefulWidget {
  final Widget child;
  final double delay;
  const BounceFromBottomAnimation(
      {super.key, required this.child, required this.delay});

  @override
  State<BounceFromBottomAnimation> createState() =>
      _BounceFromBottomAnimationState();
}

class _BounceFromBottomAnimationState extends State<BounceFromBottomAnimation>
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

    final Animation<double> curve =
        CurvedAnimation(curve: Curves.easeOutCubic, parent: _controller);

    _animation = Tween<double>(begin: 100, end: 0).animate(curve)
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
