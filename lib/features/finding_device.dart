import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FindingDevice extends StatefulWidget {
  const FindingDevice({super.key});

  @override
  State<FindingDevice> createState() => _FindingDeviceState();
}

class _FindingDeviceState extends State<FindingDevice> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          kIsWeb ? 'Login from web' : 'Login from mobile',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
