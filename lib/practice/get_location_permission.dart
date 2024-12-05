import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GetLocationPermission extends StatefulWidget {
  const GetLocationPermission({super.key});

  @override
  State<GetLocationPermission> createState() => _GetLocationPermissionState();
}

class _GetLocationPermissionState extends State<GetLocationPermission> {
  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

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

  Future<void> requestLocationPermission() async {
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
  }

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
            // await Permission.location.request();
          },
          child: const Text('Get Location Permission'),
        ),
      ),
    );
  }
}
