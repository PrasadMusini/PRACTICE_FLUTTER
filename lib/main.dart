import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:practice_flutter/animations/sunflower.dart';
import 'package:practice_flutter/features/validations.dart';
import 'package:practice_flutter/pages/card.dart';
import 'package:practice_flutter/pages/customer_details.dart';
import 'package:practice_flutter/pages/customer_login.dart';
import 'package:practice_flutter/pages/login_page.dart';
import 'package:practice_flutter/pages/status_page.dart';
import 'package:practice_flutter/pages/test.dart';
import 'package:practice_flutter/pages/signin_page.dart';
import 'package:practice_flutter/pages/test_page.dart';
import 'package:practice_flutter/practice/password_testing.dart';
import 'package:practice_flutter/programs/standard_programs.dart';
import 'package:practice_flutter/widgets/cached_network_image.dart';
import 'package:practice_flutter/widgets/line_chart.dart';
import 'package:practice_flutter/widgets/marquee.dart';
import 'package:practice_flutter/widgets/stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Validations(),
    );
  }
}
