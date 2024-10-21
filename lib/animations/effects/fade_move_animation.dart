import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class FadeMoveAnimations extends StatelessWidget {
  const FadeMoveAnimations({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeInUp(from: -100, child: const Square()),
                FadeInUp(from: 200, child: const Square()),
                FadeInUp(from: 10, child: const Square()),
                FadeInUp(from: 500, child: const Square()),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeInDown(child: const Square()),
                FadeInDown(child: const Square()),
                FadeInDown(child: const Square()),
                FadeInDown(child: const Square()),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeInLeft(child: const Square()),
                FadeInLeft(child: const Square()),
                FadeInLeft(child: const Square()),
                FadeInLeft(child: const Square()),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeOutLeft(child: const Square()),
                FadeOutLeft(child: const Square()),
                FadeOutLeft(child: const Square()),
                FadeOutLeft(child: const Square()),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeInRight(child: const Square()),
                FadeInRight(child: const Square()),
                FadeInRight(child: const Square()),
                FadeInRight(child: const Square()),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeOutRight(child: const Square()),
                FadeOutRight(child: const Square()),
                FadeOutRight(child: const Square()),
                FadeOutRight(child: const Square()),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondScreen(),
            ),
          );
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FadeInUp(child: const Square()),
            FadeInUp(child: const Square()),
            FadeInUp(child: const Square()),
            FadeInUp(child: const Square()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FadeMoveAnimations(),
            ),
          );
        },
      ),
    );
  }
}

class Square extends StatefulWidget {
  const Square({Key? key}) : super(key: key);

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blueAccent,
    );
  }
}

/* # Available Animations 
# FadeIn Animations 
FadeIn
FadeInDown
FadeInDownBig
FadeInUp
FadeInUpBig
FadeInLeft
FadeInLeftBig
FadeInRight
FadeInRightBig
FadeOut Animations 
FadeOut
FadeOutDown
FadeOutDownBig
FadeOutUp
FadeOutUpBig
FadeOutLeft
FadeOutLeftBig
FadeOutRight
FadeOutRightBig

# BounceIn Animations 
BounceInDown
BounceInUp
BounceInLeft
BounceInRight

# ElasticIn Animations 
ElasticIn
ElasticInDown
ElasticInUp
ElasticInLeft
ElasticInRight

# SlideIns Animations 
SlideInDown
SlideInUp
SlideInLeft
SlideInRight

# FlipIn Animations 
FlipInX
FlipInY

# Zooms
ZoomIn
ZoomOut

# SpecialIn Animations 
JelloIn
Attention Seeker 
All of the following animations could be infinite with a property called infinite (type Bool)

Bounce
Dance
Flash
Pulse
Roulette
ShakeX
ShakeY
Spin
SpinPerfect
Swing */