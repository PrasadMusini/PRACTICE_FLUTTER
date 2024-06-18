import 'package:flutter/material.dart';

class Sub1TestPage extends StatelessWidget {
  const Sub1TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}
