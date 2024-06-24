import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/web/screens/screen1.dart';
import 'package:practice_flutter/web/screens/screen10.dart';
import 'package:practice_flutter/web/screens/screen11.dart';
import 'package:practice_flutter/web/screens/screen12.dart';
import 'package:practice_flutter/web/screens/screen14.dart';
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
    return const Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Screen1(),
              // Screen2(content: 'ABOUT ME', backgroundColor: Colors.black),
              // Screen3(),
              // Screen4(),
              // const Screen2(
              //     content: 'AWARDS', backgroundColor: Color(0XFFea552b)),
              // Screen5(),
              // Screen6(),
              // Screen2(content: 'PORTFOLIO', backgroundColor: Color(0XFFea552b)),
              // Screen7(),
              // Screen2(content: 'SERVICES', backgroundColor: Color(0XFFea552b)),
              // Screen8(),
              Screen2(
                  content: 'TESTIMONIAL', backgroundColor: Color(0XFFea552b)),
              Screen9(),
              // Screen10(),
              // Screen11(),
              // Screen12(),
              // Screen13(),
              // Screen14(),
            ],
          ),
        ));
  }
}
