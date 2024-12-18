import 'package:flutter/material.dart';
import 'package:practice_flutter/test_cases/counter/counter.dart';

class CounterUi extends StatefulWidget {
  const CounterUi({super.key});

  @override
  State<CounterUi> createState() => _CounterUiState();
}

class _CounterUiState extends State<CounterUi> {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Text('${counter.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter.incrementCount();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
