import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/navigation/pages/config/app_routes.dart';

class Sub1UserPage extends StatelessWidget {
  const Sub1UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Sub1 User Page'),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.userSub2Screen.name);
              },
              child: const Text('Go to Sub user2'))
        ],
      )),
    );
  }
}
