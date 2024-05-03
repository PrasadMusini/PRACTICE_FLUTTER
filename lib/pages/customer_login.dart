import 'package:flutter/material.dart';
import 'package:practice_flutter/common_utils/custom_button.dart';
import 'package:practice_flutter/common_utils/styles.dart';
import 'package:practice_flutter/pages/custome_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonStyles.primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(20.0),
                  //   bottomRight: Radius.circular(20.0),
                  // ),
                  // image: DecorationImage(
                  //   image: AssetImage('assets/befor_login_illustration.png'),
                  //   fit: BoxFit.cover,
                  //   alignment: Alignment.center,
                  // ),
                  ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: Image.asset(
                          'assets/hair_fixing_logo-removebg-preview.png'),
                    ),
                    const Text(
                      'Customer Login',
                      style: TextStyle(
                        fontSize: 27,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: CommonStyles.primaryTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Login your account',
                      style: TextStyle(
                        fontSize: 26,
                        color: CommonStyles.blackColorShade,
                      ),
                    ),
                    const Text(
                      'to access all the services',
                      style: TextStyle(
                        fontSize: 26,
                        color: CommonStyles.blackColorShade,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              height: MediaQuery.of(context).size.height / 2.1,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CustomeFormField(
                          label: 'User Name',
                          validator: validateEmail,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomeFormField(
                          label: 'Password',
                          validator: validatePassword,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 15,
                                color: CommonStyles.blueColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                buttonText: 'Login',
                                color: CommonStyles.primaryTextColor,
                                onPressed: loginUser,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' Register Here',
                        style: TextStyle(
                          fontSize: 15,
                          color: CommonStyles.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an password';
    }
    if (value.length < 4) {
      return 'Password must be 4 characters or more';
    }
    if (value.length > 8) {
      return 'Password must be 8 characters or less';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void loginUser() {
    if (_formKey.currentState!.validate()) {
      print('login: Login success!');
    }
  }
}
