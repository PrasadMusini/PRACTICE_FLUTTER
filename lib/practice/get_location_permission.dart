/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class GetLocationPermission extends StatefulWidget {
  const GetLocationPermission({super.key});

  @override
  State<GetLocationPermission> createState() => _GetLocationPermissionState();
}

class _GetLocationPermissionState extends State<GetLocationPermission> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    test();
  }

  Future<void> enableLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print('Location services are not enabled');
        return;
      }
    }
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print('permission: $permission');
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      
    }
    else if (permission == LocationPermission.denied) {
        print("Location service are denied.");
        Geolocator.openAppSettings();
        return;
      }
  }

  Future<void> test() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return testLocationPermission();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return testLocationPermission();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return testLocationPermission();
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }

  Future<void> testLocationPermission() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Location Permission'),
            content: const Text(
                'This app needs location permission to work properly.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: const Text('Close App'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Geolocator.openLocationSettings();
                },
                child: const Text('Open Settings'),
              ),  
            ],
          );
        });
  }

/*     PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      showSnackbar('Location permission granted.');
    } else if (status.isDenied) {
      showSnackbar('Location permission denied.');
    } else if (status.isPermanentlyDenied) {
      showSnackbar(
          'Location permission is permanently denied, please enable it from app settings.');
      openAppSettings();
    } */

/*   Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      showSnackbar('Location permission granted.');
    } else if (status.isDenied) {
      showSnackbar('Location permission denied.');
    } else if (status.isPermanentlyDenied) {
      showSnackbar(
          'Location permission is permanently denied, please enable it from app settings.');
      openAppSettings();
    }
  } */

/*   Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print(" Location service are denied.");
        openAppSettings();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      openAppSettings();
      print(
          " Location permission are permanently denied, we cannot request permission");
      return;
    }
  }   */

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            enableLocationService();
            // await Permission.location.request();
          },
          child: const Text('Get Location Permission'),
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequestScreen extends StatefulWidget {
  const PermissionRequestScreen({Key? key}) : super(key: key);

  @override
  State<PermissionRequestScreen> createState() =>
      _PermissionRequestScreenState();
}

class _PermissionRequestScreenState extends State<PermissionRequestScreen> {
  String _statusMessage = "Press the button to request location permission.";

  Future<void> requestLocationAlwaysPermission() async {
    // Check the current permission status
    var status = await Permission.locationAlways.status;

    if (status.isDenied || status.isRestricted || status.isLimited) {
      // Request "Always On" location permission
      status = await Permission.locationAlways.request();
      if (status.isGranted) {
        setState(() {
          _statusMessage = "Location Always permission granted.";
        });
      } else {
        setState(() {
          _statusMessage =
              "Location Always permission denied. Please enable it in settings.";
        });
      }
    } else if (status.isGranted) {
      setState(() {
        _statusMessage = "Location Always permission already granted.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Permission Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: requestLocationAlwaysPermission,
              child: const Text("Request Location Permission"),
            ),
          ],
        ),
      ),
    );
  }
}
