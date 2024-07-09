import 'package:flutter/material.dart';
import 'package:practice_flutter/practice/website_layout.dart';
import 'package:practice_flutter/portfolio_web/screens/screen1.dart';
import 'package:practice_flutter/portfolio_web/screens/screen2.dart';
import 'package:practice_flutter/portfolio_web/screens/screen3.dart';
import 'package:practice_flutter/portfolio_web/screens/screen4.dart';
import 'package:practice_flutter/portfolio_web/screens/screen5.dart';
import 'package:practice_flutter/portfolio_web/screens/screen6.dart';
import 'package:practice_flutter/portfolio_web/screens/screen7.dart';
import 'package:practice_flutter/portfolio_web/screens/screen8.dart';
import 'package:practice_flutter/portfolio_web/screens/screen9.dart';
import 'package:practice_flutter/portfolio_web/screens/screen10.dart';
import 'package:practice_flutter/portfolio_web/screens/screen11.dart';
import 'package:practice_flutter/portfolio_web/screens/screen12.dart';
import 'package:practice_flutter/portfolio_web/screens/screen13.dart';
import 'package:practice_flutter/portfolio_web/screens/screen14.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _screen1Key = GlobalKey();
  final GlobalKey _screen2Key = GlobalKey();
  final GlobalKey _screen3Key = GlobalKey();
  final GlobalKey _screen4Key = GlobalKey();
  final GlobalKey _screenNKey = GlobalKey();

  @override
  void initState() {
    // initialize scroll controllers
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Scroll to Section'),
        actions: <Widget>[
          HoverButton(
            onPressed: () => scrollToSection(_screen1Key),
            child: const Text('Screen1'),
          ),
          const SizedBox(width: 20),
          HoverButton(
            onPressed: () => scrollToSection(_screen2Key),
            child: const Text('Screen2'),
          ),
          const SizedBox(width: 20),
          HoverButton(
            onPressed: () => scrollToSection(_screen3Key),
            child: const Text('Screen3'),
          ),
          const SizedBox(width: 20),
          HoverButton(
            onPressed: () => scrollToSection(_screen4Key),
            child: const Text('Screen4'),
          ),
          const SizedBox(width: 20),
          HoverButton(
            onPressed: () => scrollToSection(_screenNKey),
            child: const Text('ScreenN'),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Screen1(
              key: _screen1Key,
            ),
            Screen2(
                key: _screen2Key,
                content: 'ABOUT ME',
                backgroundColor: Colors.black),
            Screen3(
              key: _screen3Key,
            ),
            Screen4(
              key: _screen4Key,
            ),
            const Screen2(
                content: 'AWARDS', backgroundColor: Constants.orangeColor),
            const Screen5(),
            const Screen6(),
            const Screen2(
                content: 'PORTFOLIO', backgroundColor: Constants.orangeColor),
            const Screen7(),
            const Screen2(
                content: 'SERVICES', backgroundColor: Constants.orangeColor),
            const Screen8(),
            const Screen2(
                content: 'TESTIMONIAL', backgroundColor: Constants.orangeColor),
            const Screen9(),
            const Screen2(
                content: 'OUR NEWS', backgroundColor: Constants.orangeColor),
            const Screen10(),
            const Screen2(
                content: 'LET\'S TALK ',
                backgroundColor: Constants.orangeColor),
            const Screen11(),
            const Screen12(),
            const Screen13(),
            const Screen14(),
          ],
        ),
      ),
    );
    /*  
         ListView(
          children: [
            Screen1(
              key: _screen1Key,
            ),
            Screen2(
                key: _screen2Key,
                content: 'ABOUT ME',
                backgroundColor: Colors.black),
            Screen3(
              key: _screen3Key,
            ),
            Screen4(
              key: _screen4Key,
            ),
            const Screen2(
                content: 'AWARDS', backgroundColor: Constants.orangeColor),
            const Screen5(),
            const Screen6(),
            const Screen2(
                content: 'PORTFOLIO', backgroundColor: Constants.orangeColor),
            const Screen7(),
            const Screen2(
                content: 'SERVICES', backgroundColor: Constants.orangeColor),
            const Screen8(),
            const Screen2(
                content: 'TESTIMONIAL', backgroundColor: Constants.orangeColor),
            Screen9(
              key: _screenNKey,
            ),
            // Screen2(
            //     content: 'OUR NEWS', backgroundColor: Constants.orangeColor),
            // Screen10(),
            // Screen2(
            //     content: 'LET\'S TALK ',
            //     backgroundColor: Constants.orangeColor),
            // Screen11(),
            // Screen12(),
            // Screen13(),
            // Screen14(),
          ],
        ));
   */
  }
}
