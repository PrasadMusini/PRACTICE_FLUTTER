import 'package:flutter/material.dart';
import 'package:practice_flutter/practice/website_layout.dart';
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
import 'package:practice_flutter/web/utilities/constants.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

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

  late ScrollController _webScrollController;

  @override
  void initState() {
    // initialize scroll controllers
    _webScrollController = ScrollController();

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
      body: WebSmoothScroll(
        controller: _scrollController,
        // scrollOffset: 100,
        curve: Curves.easeInOutCirc,
        child: SingleChildScrollView(
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
            ],
          ),
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
