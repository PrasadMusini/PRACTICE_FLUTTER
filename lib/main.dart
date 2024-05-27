import 'package:flutter/material.dart';
import 'package:practice_flutter/common_utils/common_utils.dart';
import 'package:practice_flutter/temp/page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool seenOnboarding = await hasSeenOnboarding();
  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;

  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
      // home: seenOnboarding ? const DashBoardPage() : const OnboardingScreen(),
    );
  }
}
//  test change