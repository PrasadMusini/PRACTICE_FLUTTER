import 'package:flutter/material.dart';
import 'package:practice_flutter/web/screens/screen1.dart';
import 'package:practice_flutter/web/screens/screen10.dart';
import 'package:practice_flutter/web/screens/screen2.dart';
import 'package:practice_flutter/web/screens/screen3.dart';
import 'package:practice_flutter/web/screens/screen4.dart';
import 'package:practice_flutter/web/screens/screen5.dart';
import 'package:practice_flutter/web/screens/screen6.dart';
import 'package:practice_flutter/web/screens/screen7.dart';
import 'package:practice_flutter/web/screens/screen8.dart';
import 'package:practice_flutter/web/screens/screen9.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreenAccent[100],
        body: const SingleChildScrollView(
          child: Column(
            children: [
              // Screen1(),
              // Screen2(),
              // Screen3(),
              // Screen4(),
              // Screen5(),
              // Screen6(),
              // Screen7(),
              // Screen8(),
              // Screen9(),
              Screen10(),
            ],
          ),
        ));
  }
}
