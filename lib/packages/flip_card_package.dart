import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipCardPack extends StatelessWidget {
  const FlipCardPack({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('FlipCard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlipCard(
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                side: CardSide.FRONT,
                front: Container(
                  color: Colors.grey,
                  width: 200.0,
                  height: 400.0,
                  child: const Center(child: Text('Front Side')),
                ),
                back: Container(
                  color: Colors.blueAccent,
                  width: 200.0,
                  height: 400.0,
                  child: const Center(child: Text('Back Side')),
                ),
              ),
            ],
          ),
        ));
  }
}
