import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:practice_flutter/animations/sunflower.dart';
import 'package:practice_flutter/auth/signin.dart';
import 'package:practice_flutter/features/validations.dart';
import 'package:practice_flutter/pages/card.dart';
import 'package:practice_flutter/pages/customer_details.dart';
import 'package:practice_flutter/pages/customer_login.dart';
import 'package:practice_flutter/pages/login_page.dart';
import 'package:practice_flutter/pages/status_page.dart';
import 'package:practice_flutter/pages/test.dart';
import 'package:practice_flutter/pages/test_page.dart';
import 'package:practice_flutter/practice/password_testing.dart';
import 'package:practice_flutter/programs/standard_programs.dart';
import 'package:practice_flutter/temp/page1.dart';
import 'package:practice_flutter/temp/page2.dart';
import 'package:practice_flutter/theme/theme.dart';
import 'package:practice_flutter/theme/theme_change.dart';
import 'package:practice_flutter/theme/theme_provider.dart';
import 'package:practice_flutter/widgets/cached_network_image.dart';
import 'package:practice_flutter/widgets/line_chart.dart';
import 'package:practice_flutter/widgets/marquee.dart';
import 'package:practice_flutter/widgets/stepper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page2(),
      //theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
