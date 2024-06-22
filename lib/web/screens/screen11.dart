import 'package:flutter/material.dart';

class Screen11 extends StatelessWidget {
  const Screen11({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.5,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Do you have a question, an idea, or a\nproject you need help with? Contact us!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: size.width / 2,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.black,
                border: Border.all(color: Colors.grey)),
            child: const Text(
              'Contact Form',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
