import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          barrierDismissible: false, // Prevent dismiss on tap outside
          builder: (context) => AlertDialog(
            title: const Text("Exit"),
            content: const Text("Do you want to exit?"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pop(true), // Return true to pop the route
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pop(false), // Return false to stay on the route
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false; // Handle null case by returning false (stay on the route)
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        bool canPop = await _onWillPop(context);
        if (canPop) {
          Navigator.pop(context);
        } else {
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _onWillPop(context).then((exitConfirmed) {
                if (exitConfirmed) {
                  // Navigate back to the first page (HomePage) if exit is confirmed
                  Navigator.pop(context);
                }
              });
            },
            child: const Text('Back to First Page'),
          ),
        ),
      ),
    );
  }
}
