import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MarqueeWid extends StatefulWidget {
  const MarqueeWid({super.key});

  @override
  State<MarqueeWid> createState() => _MarqueeWidState();
}

class _MarqueeWidState extends State<MarqueeWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Marquee(
              text: '         Password must be 8 characters or less',
              numberOfRounds: null,
            ),
          ],
        ),
      ),
    );
  }
}
