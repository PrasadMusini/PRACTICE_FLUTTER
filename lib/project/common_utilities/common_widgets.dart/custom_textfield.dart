import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  final Color blueColor = const Color.fromARGB(255, 13, 79, 159);
  // final Color blueColor = const Color(0xFF7ba4d7);
  final String? labelText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final String? errorText;
  final String? Function(String?)? validator;
  final String? counterText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? errorMaxLines;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  const CustomField({
    Key? key,
    required this.labelText,
    this.controller,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.errorText,
    this.validator,
    this.counterText,
    this.maxLength,
    this.keyboardType,
    this.errorMaxLines,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obscureText,
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        counterText: counterText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10).copyWith(left: 15),
        errorMaxLines: errorMaxLines,
        errorText: errorText,
        filled: true,
        isDense: true,
        isCollapsed: true,
        fillColor: const Color(0xFFfafafa),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: Colors.grey.shade400,
            color: blueColor,
            // width: 1.5,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        floatingLabelStyle: TextStyle(
          color: blueColor,
        ),
        suffixIcon: suffixIcon,
      ),
      inputFormatters: inputFormatters,
    );
  }

  InputBorder? border(
      {required Color borderColor, required double radius, double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: width,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    );
  }
}
