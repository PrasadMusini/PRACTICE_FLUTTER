import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  int multiplyValue(int num) {
    return num * 2;
  }

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value:', key: Key('counterLabel')),
            Text('$_counter',
                key: const Key('counterValue'),
                style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
