import 'package:flutter/material.dart';
import 'package:practice_flutter/features/ai_chatbot.dart';
import 'package:practice_flutter/practice/access_storage_without_using_manage_external_storage.dart';
import 'package:practice_flutter/practice/get_location_permission.dart';
import 'package:practice_flutter/test/test1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetLocationPermission(),
    );
  }
}
