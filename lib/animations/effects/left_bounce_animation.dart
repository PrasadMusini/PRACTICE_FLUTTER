import 'package:flutter/material.dart';

class AnimationFromLeftToRight extends StatefulWidget {
  final double delay;
  final Widget child;
  const AnimationFromLeftToRight(
      {super.key, this.delay = 1, required this.child});

  @override
  State<AnimationFromLeftToRight> createState() =>
      _AnimationFromLeftToRightState();
}

class _AnimationFromLeftToRightState extends State<AnimationFromLeftToRight>
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
        CurvedAnimation(curve: Curves.easeInOutCubic, parent: _controller);

    _animation = Tween<double>(begin: -100, end: 0).animate(curve)
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
