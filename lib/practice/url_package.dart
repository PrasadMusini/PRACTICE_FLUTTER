import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlPack extends StatelessWidget {
  const UrlPack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: openMap,
              child: const Text('Open Maps'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: openPhone,
              child: const Text('Open Phone'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openMap() async {
    const destinationLatitude = 17.525830;
    const destinationLongitude = 78.421710;

// Replace with getting current location (optional)
    const String url =
        'https://www.google.com/maps?q=$destinationLatitude,$destinationLongitude';

    // 'https://www.google.com/maps?dir=$sourceLocation&daddr=$destinationLatitude,$destinationLongitude';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      print(e);
    }
  }

  Future<void> openPhone() async {
    int phonenumber = 9999999999;
    final url = 'tel:$phonenumber';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      print(e);
    }
  }
}
