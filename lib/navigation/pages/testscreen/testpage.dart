import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/navigation/pages/config/app_routes.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        return context.pop();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Test Page'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  context.goNamed(Routes.testSub1Screen.name);
                },
                child: const Text('Go to sub1 test page'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  context.goNamed(Routes.testSub2Screen.name);
                },
                child: const Text('Go to sub2 test page'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  context.go(Routes.testSub2Screen.path);
                },
                child: const Text('Empty route'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
