import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionChecking extends StatefulWidget {
  const InternetConnectionChecking({super.key});

  @override
  State<InternetConnectionChecking> createState() =>
      _InternetConnectionCheckingState();
}

class _InternetConnectionCheckingState
    extends State<InternetConnectionChecking> {
  String status = 'Please check you are connection';
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    checkInternetStatus();
  }

  @override
  void dispose() {
    //! Make sure to cancel the screams that we are using to avoid the memory leakage
    _streamSubscription?.cancel();
    super.dispose();
  }

  void checkInternetStatus() {
    InternetConnection().onStatusChange.listen((InternetStatus result) {
      switch (result) {
        case InternetStatus.connected:
          // The internet is now connected
          status = 'You are connected';
          break;
        case InternetStatus.disconnected:
          // The internet is now disconnected
          status = 'Please check you are connection';
          break;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(status),
      ),
    );
  }
}
