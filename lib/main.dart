import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:practice_flutter/practice/floating_bottom_navbar.dart';
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
    return const MaterialApp(
      home: MainScreen(title: 'title'),
    );
  }
}

class UserTrackingScreen extends StatefulWidget {
  const UserTrackingScreen({super.key});

  @override
  _UserTrackingScreenState createState() => _UserTrackingScreenState();
}

class _UserTrackingScreenState extends State<UserTrackingScreen> {
  String locationMessage = "Press the button to start tracking";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Tracking App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationMessage),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await requestLocationPermission();
                startBackgroundService();
                setState(() {
                  locationMessage = "Tracking started!";
                });
              },
              child: const Text("Start Tracking"),
            ),
          ],
        ),
      ),
    );
  }

  /// Requests location permission and fetches the user's current location
  Future<void> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permissions are permanently denied.");
      return;
    }

    // Fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print("Current Location: ${position.latitude}, ${position.longitude}");
  }

  /// Starts the background service to track location periodically
  void startBackgroundService() {
    Workmanager().registerPeriodicTask(
      "locationTask",
      "fetchLocation",
      frequency:
          const Duration(minutes: 15), // Minimum interval allowed by Android
    );
    print("Background service started.");
  }
}
