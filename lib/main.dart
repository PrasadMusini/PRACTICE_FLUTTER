import 'package:flutter/material.dart';
import 'package:practice_flutter/features/app_lunch_process.dart';
import 'package:practice_flutter/practice/practice_ui.dart';
import 'package:practice_flutter/project/onboarding/onboarding_mobile.dart';
import 'package:practice_flutter/project/signin/signin_mobile.dart';
import 'package:practice_flutter/project/splash/splash_mobile.dart';
import 'package:practice_flutter/project/splash/splash_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashMobile(),
    );
  }
}
