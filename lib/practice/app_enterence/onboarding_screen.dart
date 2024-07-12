import 'package:flutter/material.dart';
import 'package:practice_flutter/practice/app_enterence/consts.dart';
import 'package:practice_flutter/practice/app_enterence/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Onboarding Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await SharedPreferencesHelper.setVisited(true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text("Let's Start"),
            ),
          ],
        ),
      ),
    );
  }
}
