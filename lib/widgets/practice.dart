import 'package:flutter/material.dart';
import 'package:practice_flutter/animations/hero.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HeroAnim(),
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
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 134, 8, 8),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
