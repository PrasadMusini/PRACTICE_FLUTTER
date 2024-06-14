import 'package:flutter/material.dart';

class FullScreenImageWithDesign extends StatelessWidget {
  const FullScreenImageWithDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
              child: Image.network(
            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
            fit: BoxFit.cover,
          )
              ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 200.0,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 200.0,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 200.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
