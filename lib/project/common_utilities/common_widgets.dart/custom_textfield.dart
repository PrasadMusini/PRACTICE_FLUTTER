import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  final Color blueColor = const Color.fromARGB(255, 13, 79, 159);
  // final Color blueColor = const Color(0xFF7ba4d7);
  final String? labelText;
  final String? hintText;
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
    super.key,
    this.labelText,
    this.hintText,
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
  });

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
        border: customBorder(borderColor: Colors.grey.shade100),
        enabledBorder: customBorder(borderColor: Colors.grey.shade300),
        focusedBorder: customBorder(borderColor: blueColor),
        errorBorder: customBorder(borderColor: Colors.red.shade400, width: 2.0),
        labelText: labelText,
        hintText: hintText,
        labelStyle: customStyle(),
        hintStyle: customStyle(),
        floatingLabelStyle: TextStyle(
          color: blueColor,
        ),
        suffixIcon: suffixIcon,
      ),
      inputFormatters: inputFormatters,
    );
  }

  TextStyle customStyle() {
    return TextStyle(color: Colors.grey.shade500, fontSize: 12);
  }

  OutlineInputBorder? customBorder(
      {required Color borderColor, double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: width,
      ),
      borderRadius: BorderRadius.circular(7.0),
    );
  }
}
