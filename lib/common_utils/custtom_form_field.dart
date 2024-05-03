import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String? errorText;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomeFormField({
    Key? key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLengthEnforcement,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.errorText,
    this.onChanged,
    this.inputFormatters,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label text
        // Row(
        //   children: [
        //     Text(
        //       '$label ',
        //       style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        //     ),
        //     const Text(
        //       '*',
        //       style: TextStyle(color: Colors.red),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 5.0,
        // ),
        // textfield
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: label,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.only(
                  top: 15, bottom: 10, left: 15, right: 15),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 102, 102, 102),
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              hintText: 'Enter $label',
              hintStyle: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w400),
              errorText: errorText,
              counterText: ""),
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
        ),
      ],
    );
  }
}
