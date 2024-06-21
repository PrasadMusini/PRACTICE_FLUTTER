import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final String content;
  final Color backgroundColor;
  const Screen2(
      {super.key, required this.content, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.14,
      color: backgroundColor,
      alignment: Alignment.center,
      child: Text(
        content,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: (size.height * 0.14) / 2),
      ),
    );
  }
}
