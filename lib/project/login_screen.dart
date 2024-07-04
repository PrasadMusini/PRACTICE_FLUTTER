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
  bool? checkValue = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: signinFromMobile(),
    );
  }

  Widget signinFromMobile() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30)
              .copyWith(top: size.height / 5),
          child: Form(
            key: _formKey,
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
                  labelText: 'Name',
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: checkValue,
                          shape: const CircleBorder(),
                          side: const BorderSide(
                              strokeAlign: BorderSide.strokeAlignCenter),
                          onChanged: (value) {
                            setState(() {
                              checkValue = value;
                            });
                          },
                        ),
                        const Text('Remember me'),
                      ],
                    ),
                    const Text('Forgot Password'),
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
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
