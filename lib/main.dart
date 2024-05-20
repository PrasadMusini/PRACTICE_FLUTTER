// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:practice_flutter/animations/sunflower.dart';
// import 'package:practice_flutter/auth/signin.dart';
// import 'package:practice_flutter/features/validations.dart';
// import 'package:practice_flutter/pages/card.dart';
// import 'package:practice_flutter/pages/customer_details.dart';
// import 'package:practice_flutter/pages/customer_login.dart';
// import 'package:practice_flutter/pages/login_page.dart';
// import 'package:practice_flutter/pages/status_page.dart';
// import 'package:practice_flutter/pages/test.dart';
// import 'package:practice_flutter/pages/test_page.dart';
// import 'package:practice_flutter/practice/password_testing.dart';
// import 'package:practice_flutter/practice/practice_flutter.dart';
// import 'package:practice_flutter/programs/standard_programs.dart';
// import 'package:practice_flutter/temp/page1.dart';
// import 'package:practice_flutter/temp/page2.dart';
// import 'package:practice_flutter/theme/theme.dart';
// import 'package:practice_flutter/theme/theme_change.dart';
// import 'package:practice_flutter/theme/theme_provider.dart';
// import 'package:practice_flutter/widgets/cached_network_image.dart';
// import 'package:practice_flutter/widgets/line_chart.dart';
// import 'package:practice_flutter/widgets/marquee.dart';
// import 'package:practice_flutter/widgets/stepper.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => ThemeProvider(),
//       )
//     ],
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Xtest(),
//       //theme: Provider.of<ThemeProvider>(context).themeData,
//     );
//   }
// }

// class Xtest extends StatefulWidget {
//   const Xtest({super.key});

//   @override
//   State<Xtest> createState() => _XtestState();
// }

// class _XtestState extends State<Xtest> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       home: OnBoardingSlider(
//         headerBackgroundColor: Colors.white,
//         finishButtonText: 'Register',
//         finishButtonStyle: const FinishButtonStyle(
//           backgroundColor: Colors.black,
//         ),
//         skipTextButton: const Text('Skip'),
//         trailing: const Text('Login'),
//         background: [
//           Image.asset('assets/dragon.jpg'),
//           Image.asset('assets/dragon.jpg'),
//           Image.asset('assets/dragon.jpg'),
//           Image.asset('assets/dragon.jpg'),
//         ],
//         totalPage: 4,
//         speed: 1.8,
//         pageBodies: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: const Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 480,
//                 ),
//                 Text('Page 1'),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: const Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 480,
//                 ),
//                 Text('Page 2'),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: const Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 480,
//                 ),
//                 Text('Page 3'),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: const Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 480,
//                 ),
//                 Text('Page 4'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_flutter/common_utils/common_utils.dart';
import 'package:practice_flutter/features/onboarding_screen.dart';
// import 'onboarding_screen.dart';

// import 'package:onboarding_app/size_config.dart';
// import 'package:onboarding_app/onboarding_contents.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: seenOnboarding ? const DashBoardPage() : const OnboardingScreen(),
    );
  }
}
