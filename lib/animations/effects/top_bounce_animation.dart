// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BounceFromTopAnimation extends StatefulWidget {
  final double delay;
  final double begin;
  final double end;
  final Widget child;

  const BounceFromTopAnimation(
      {super.key,
      required this.delay,
      this.begin = -100,
      this.end = 0,
      required this.child});

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

    _animation =
        Tween<double>(begin: widget.begin, end: widget.end).animate(curve)
          ..addListener(() {
            setState(() {});
          });
// Loop animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
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
