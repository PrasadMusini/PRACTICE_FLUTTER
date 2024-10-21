import 'package:flutter/material.dart';
import 'package:practice_flutter/packages/internet_connection_checker_pack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectivity Refresh Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckConnection(),
    );
  }
}
