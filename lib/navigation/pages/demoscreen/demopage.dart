import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        return context.pop();
      },
      child: const Scaffold(
        body: Center(
          child: Text('Demo Page'),
        ),
      ),
    );
  }
}
