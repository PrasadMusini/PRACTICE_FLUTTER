import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/navigation/pages/config/app_routes.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User Page'),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.goNamed(Routes.userSub1Screen.name);
              },
              child: const Text('Go to sub1 user page'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.goNamed(Routes.userSub2Screen.name);
              },
              child: const Text('Go to sub2 user page'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.go(Routes.userSub2Screen.path);
              },
              child: const Text('Empty route'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.goNamed('Sub1user');
              },
              child: const Text('Sub1user'),
            ),
          ],
        ),
      ),
    );
  }
}
