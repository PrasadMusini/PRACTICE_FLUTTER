import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 22,
      backgroundColor: Colors.black,
      child: Icon(
        Icons.keyboard_arrow_left_rounded,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
