import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:practice_flutter/practice/fnb/route_config.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(const MyApp());
}

/// Callback for background task
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Fetch and print the background location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print("Background Location: ${position.latitude}, ${position.longitude}");
    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
