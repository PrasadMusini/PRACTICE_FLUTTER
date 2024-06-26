import 'package:flutter/material.dart';
import 'package:practice_flutter/temp/page2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color textFieldFillColor = const Color(0xFFfafafa);
  Color blueColor = const Color(0xFF7ba4d7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: signinFromMobile(),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        side: BorderSide(color: Colors.grey.shade400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Icon(icon),
    );
  }

  Widget horizontalDivider() {
    return Container(
      height: 0.5,
      color: Colors.grey.shade400,
    );
  }
}
