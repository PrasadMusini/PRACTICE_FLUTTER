import 'package:flutter/material.dart';

/* void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingNumbersAnimation(
          percentage: 75,
          delay: 2,
        ),
      ),
    );
  }
} */

class AnimationLoadingNumbers extends StatefulWidget {
  final double percentage;
  final double delay;
  final TextStyle style;

  const AnimationLoadingNumbers(
      {super.key,
      required this.percentage,
      required this.delay,
      this.style = const TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black)});

  @override
  State<AnimationLoadingNumbers> createState() =>
      _AnimationLoadingNumbersState();
}

class _AnimationLoadingNumbersState extends State<AnimationLoadingNumbers> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(seconds: widget.delay.round()),
      tween: Tween<double>(begin: 0, end: widget.percentage),
      builder: (context, value, child) {
        return Text("${value.toStringAsFixed(0)} %",
            // style: const TextStyle(
            //     fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
            style: widget.style);
      },
    );
  }
}
