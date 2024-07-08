import 'package:flutter/material.dart';

class AnimationFromBottomToTop extends StatefulWidget {
  final Widget child;
  final double delay;
  final double beginScale;
  final double endScale;
  const AnimationFromBottomToTop(
      {super.key,
      required this.child,
      required this.delay,
      this.beginScale = 100,
      this.endScale = 0});

  @override
  State<AnimationFromBottomToTop> createState() =>
      _AnimationFromBottomToTopState();
}

class _AnimationFromBottomToTopState extends State<AnimationFromBottomToTop>
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

    _animation = Tween<double>(begin: widget.beginScale, end: widget.endScale)
        .animate(curve)
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
