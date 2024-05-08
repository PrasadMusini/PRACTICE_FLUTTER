import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:practice_flutter/features/auth.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Color textFieldFillColor = const Color(0xFFfafafa);
  Color blueColor = const Color(0xFF7ba4d7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb ? signinFromWeb() : signinFromMobile(),
    );
  }

  Widget signinFromMobile() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome back'),
            const Text('Please enter your informations'),
            const SizedBox(
              height: 20,
            ),
            const CustomField(
              labelText: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomField(
              labelText: 'Password',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Remember me'),
                Text('Forgot Password'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomBtn(
                    backgroundColor: Colors.black,
                    radius: 5,
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: horizontalDivider(),
                ),
                const Text('   OR   '),
                Expanded(
                  child: horizontalDivider(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: CustomBtn(
                //     backgroundColor: Colors.white,
                //     radius: 5,
                //     onPressed: () {},
                //     child: const Text('Signin in with Google'),
                //   ),
                // ),
                authBox(Icons.golf_course),
                authBox(Icons.egg_alt_rounded),
                authBox(Icons.unarchive_rounded),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? '),
                Text('Sign up for free :)'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget authBox(IconData icon) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: textFieldFillColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        side: BorderSide(color: Colors.grey.shade400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Icon(icon),
    );
  }
  //  Widget authBox(IconData icon) {
  //   return InkWell(
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
  //       decoration: BoxDecoration(
  //         color: textFieldFillColor,
  //         border: Border.all(
  //           color: Colors.grey.shade400,
  //         ),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Icon(icon),
  //     ),
  //   );

  // Widget signinFromWeb() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           color: Colors.greenAccent.shade400,
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           padding: const EdgeInsets.all(50),
  //           child: signinFromMobile(),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget signinFromWeb() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.greenAccent.shade400,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(50),
            child: const SignInSignUpScreen(),
          ),
        ),
      ],
    );
  }

  Widget horizontalDivider() {
    return Container(
      height: 0.5,
      color: Colors.grey.shade400,
    );
  }
}

class CustomField extends StatelessWidget {
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

  const CustomField({
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
        contentPadding: const EdgeInsets.only(top: 5, left: 15),
        errorMaxLines: errorMaxLines,
        errorText: errorText,
        filled: true,
        fillColor: const Color(0xFFfafafa),
        border: border(borderColor: Colors.grey.shade400, radius: 5),
        enabledBorder: border(borderColor: Colors.grey.shade400, radius: 5),
        focusedBorder: border(
          borderColor: const Color(0xFF7ba4d7),
          radius: 5,
        ),
        errorBorder: border(borderColor: Colors.red.shade400, radius: 5),
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

class CustomBtn extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final double? radius;
  const CustomBtn(
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
          ),
        ),
        child: child);
  }
}
