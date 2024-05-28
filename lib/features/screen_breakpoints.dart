import 'package:flutter/material.dart';

class ScreenBreakPoints extends StatelessWidget {
  const ScreenBreakPoints({super.key});

//   Mobile devices – 320px — 480px.
//   iPads, Tablets – 481px — 768px.
//   Small screens, laptops – 769px — 1024px.
//   Desktops, large screens – 1025px — 1200px.
//   Extra large screens, TV – 1201px, and more.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Containers'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            //   Desktops, large screens – 1025px — 1200px.
            // Display the container for screen width above 1200
            return Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  'Width > ${constraints.maxWidth}',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            );
          } else if (constraints.maxWidth > 768) {
            //   Small screens, laptops – 769px — 1024px.
            // Display the container for screen width above 800
            return Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Width > ${constraints.maxWidth}',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            );
          } else if (constraints.maxWidth > 480) {
            //   iPads, Tablets – 481px — 768px.
            // Display the container for screen width above 480
            return Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  'Width > ${constraints.maxWidth}',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            );
          } else {
            //   Mobile devices – 320px — 480px.
            // Display a default container for screen width 400 or less
            return Container(
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'Width <= 400',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
