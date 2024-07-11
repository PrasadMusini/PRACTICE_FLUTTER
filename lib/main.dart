import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_flutter/project/navigation/router_config.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      // const MyApp(),
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // 812
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );

    // return MaterialApp.router(
    //   routerDelegate: router.routerDelegate,
    //   routeInformationParser: router.routeInformationParser,
    //   routeInformationProvider: router.routeInformationProvider,
    // );
  }
}
