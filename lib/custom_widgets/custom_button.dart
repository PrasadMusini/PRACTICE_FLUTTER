import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final double? radius;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.backgroundColor,
      this.radius = 5});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!),
            )),
        child: child);
  }
}
