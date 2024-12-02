import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen1.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen11.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen12.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen13.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen14.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen16.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen2.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen3.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen4.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen5.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen6.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen7.dart';
import 'package:practice_flutter/portfolio_web/mobile_portfolio/screens/mobile_screen8.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileMainScreen extends StatelessWidget {
  const MobileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const MobileScreen3(),
          const MobileScreen1(),
          const MobileScreen2(
              content: ' ABOUT ME ', backgroundColor: Colors.black),
          const MobileScreen3(),
          const MobileScreen2(
              content: ' SKILLS & COMPETENCIES ',
              backgroundColor: Colors.black),
          const MobileScreen4(),
          const MobileScreen2(
              content: ' PROJECTS & WORKS ', backgroundColor: Colors.black),
          const MobileScreen16(),
          const MobileScreen2(
              content: ' CERTIFICATIONS ',
              backgroundColor: Constants.orangeColor),
          const MobileScreen5(),
          const MobileScreen2(
              content: ' EDUCATION & EXPERIENCE ',
              backgroundColor: Color.fromARGB(255, 28, 215, 90)),
          const MobileScreen6(),
          const MobileScreen2(
              content: ' PORTFOLIO ', backgroundColor: Constants.orangeColor),
          const MobileScreen7(),
          const MobileScreen2(
              content: ' AREA OF EXPERTISE ',
              backgroundColor: Constants.orangeColor),
          const MobileScreen8(),
          const MobileScreen2(
              content: ' CONTACT ME ', backgroundColor: Constants.orangeColor),
          MobileScreen11(),
          const MobileScreen12(),
          const MobileScreen13(),
          const MobileScreen14(),
        ],
      ),
    ));
  }
}
