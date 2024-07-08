import 'package:flutter/material.dart';
import 'package:practice_flutter/practice/app_enterence/consts.dart';
import 'package:practice_flutter/practice/app_enterence/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();

    _checkLoggedIn();
  }

  Future<void> _checkLoggedIn() async {
    bool loggedIn = await SharedPreferencesHelper.getLoggedIn();

    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await SharedPreferencesHelper.setLoggedIn(true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
