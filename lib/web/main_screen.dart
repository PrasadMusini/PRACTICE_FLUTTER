import 'package:flutter/material.dart';
import 'package:practice_flutter/web/screens/screen1.dart';
import 'package:practice_flutter/web/screens/screen2.dart';
import 'package:practice_flutter/web/screens/screen3.dart';
import 'package:practice_flutter/web/screens/screen4.dart';
import 'package:practice_flutter/web/screens/screen5.dart';
import 'package:practice_flutter/web/screens/screen6.dart';
import 'package:practice_flutter/web/screens/screen7.dart';
import 'package:practice_flutter/web/screens/screen8.dart';
import 'package:practice_flutter/web/screens/screen9.dart';
import 'package:practice_flutter/web/screens/screen10.dart';
import 'package:practice_flutter/web/screens/screen11.dart';
import 'package:practice_flutter/web/screens/screen12.dart';
import 'package:practice_flutter/web/screens/screen13.dart';
import 'package:practice_flutter/web/screens/screen14.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Screen1(),
              const Screen2(content: 'ABOUT ME', backgroundColor: Colors.black),
              const Screen3(),
              const Screen4(),
              const Screen2(
                  content: 'AWARDS', backgroundColor: Color(0XFFea552b)),
              const Screen5(),
              Screen6(),
              const Screen2(
                  content: 'PORTFOLIO', backgroundColor: Color(0XFFea552b)),
              const Screen7(),
              const Screen2(
                  content: 'SERVICES', backgroundColor: Color(0XFFea552b)),
              const Screen8(),
              const Screen2(
                  content: 'TESTIMONIAL', backgroundColor: Color(0XFFea552b)),
              const Screen9(),
              const Screen2(
                  content: 'OUR NEWS', backgroundColor: Color(0XFFea552b)),
              const Screen10(),
              const Screen2(
                  content: 'LET\'S TALK ', backgroundColor: Color(0XFFea552b)),
              const Screen11(),
              const Screen12(),
              const Screen13(),
              const Screen14(),
            ],
          ),
        ));
  }
}

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: const Color(0XFFe0ebf2),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(5, 5),
                blurRadius: 1,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: const Text(
            'Explore More',
            style: TextStyle(
                color: Colors.white,
                // fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
