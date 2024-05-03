import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
