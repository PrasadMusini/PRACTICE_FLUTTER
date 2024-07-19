import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_carousel.dart';
import 'package:practice_flutter/project/main_screen/pages/story/story_provider.dart';
import 'package:practice_flutter/project/navigation/router_config.dart';
import 'package:practice_flutter/project/theme/them_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      // const MyApp(),
      DevicePreview(
        enabled: true,
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => StoryProvider()),
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
            // ChangeNotifierProvider(create: (context) => HomeProvider()),
          ],
          child: const MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Change this to your desired color
      statusBarIconBrightness: Brightness.dark, // For light icons
      // statusBarIconBrightness: Brightness.light, // For dark icons
    ));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        theme: themeProvider.themeData,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );

    /*   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Test(),
    ); */

    // return MaterialApp.router(
    //   routerDelegate: router.routerDelegate,
    //   routeInformationParser: router.routeInformationParser,
    //   routeInformationProvider: router.routeInformationProvider,
    // );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          // color: Colors.grey,
          // padding: const EdgeInsets.all(10),
          height: 200,
          child: CustomCarousel(
            height: 200,
          ),
        ),
      ),
    );
  }
}
