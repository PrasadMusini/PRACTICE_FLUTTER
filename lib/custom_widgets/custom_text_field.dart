import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final String? errorText;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? counterText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? errorMaxLines;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
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
    this.labelText,
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
        contentPadding: const EdgeInsets.only(top: 5, left: 10),
        errorMaxLines: errorMaxLines,
        errorText: errorText,
        border: border(borderColor: Colors.grey.shade700, radius: 10),
        enabledBorder: border(borderColor: Colors.grey.shade700, radius: 10),
        focusedBorder:
            border(borderColor: Colors.grey.shade900, radius: 10, width: 1.5),
        errorBorder: border(borderColor: Colors.grey.shade700, radius: 10),
        labelText: labelText,
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
