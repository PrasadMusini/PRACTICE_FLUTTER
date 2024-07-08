// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimationFromTopToBottom extends StatefulWidget {
  // final double delay;
  // final double begin;
  // final double end;
  // final Widget child;
  final double delay;
  final double beginScale;
  final double endScale;
  final Widget child;

  const AnimationFromTopToBottom(
      {super.key,
      required this.delay,
      this.beginScale = -100,
      this.endScale = 0,
      required this.child});

  @override
  State<AnimationFromTopToBottom> createState() =>
      _AnimationFromTopToBottomState();
}

class _AnimationFromTopToBottomState extends State<AnimationFromTopToBottom>
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

    _animation = Tween<double>(begin: widget.beginScale, end: widget.endScale)
        .animate(curve)
      ..addListener(() {
        setState(() {});
      });
// Loop animation
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _controller.reset();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _controller.forward();
    //   }
    // });

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
