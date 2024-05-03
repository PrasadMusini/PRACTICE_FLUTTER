import 'package:flutter/material.dart';
import 'package:practice_flutter/widgets/practice.dart';

class HeroAnim extends StatelessWidget {
  const HeroAnim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Practice(),
              ),
            );
          },
          child: Hero(
            tag: 'tag-1',
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade100,
              ),
              child: const Text(
                'Hero Animation',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
