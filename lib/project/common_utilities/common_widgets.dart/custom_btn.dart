import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final Color borderColor;
  final double? radius;
  final double verticalPadding;
  const CustomBtn(
      {super.key,
      required this.onPressed,
      required this.child,
      this.backgroundColor,
      this.borderColor = const Color(0xFF000000),
      this.verticalPadding = 0,
      this.radius = 5});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: borderColor,
          ),
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        child: child);
  }
}
