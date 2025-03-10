import 'package:flutter/material.dart';

class CircleDesignScreen extends StatelessWidget {
  const CircleDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth; // Get device width
          double circleSize =
              screenWidth * 1.2; // Make the circle wider than the screen

          return Stack(
            children: [
              // Top Circle (Half Visible)
              Positioned(
                top: -circleSize / 1.4, // Move half out of screen
                left: -((circleSize - screenWidth) / 2), // Center it
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green, Colors.purple],
                      )
                      // color: Colors.blue, // Change as needed
                      ),
                ),
              ),

              // Bottom Circle (Half Visible)
              Positioned(
                bottom: -circleSize / 2, // Move half out of screen
                left: -((circleSize - screenWidth) / 2), // Center it
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.red, Colors.yellow],
                      )
                      // color: Colors.green, // Change as needed
                      ),
                ),
              ),

              // Centered Text
              const Center(
                child: Text(
                  "Hello, Flutter!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
