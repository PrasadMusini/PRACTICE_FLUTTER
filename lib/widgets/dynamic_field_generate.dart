import 'package:flutter/material.dart';

class DynamicFieldGenerate extends StatefulWidget {
  const DynamicFieldGenerate({super.key});

  @override
  State<DynamicFieldGenerate> createState() => _DynamicFieldGenerateState();
}

class _DynamicFieldGenerateState extends State<DynamicFieldGenerate> {
  final List<TextEditingController> _addressControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form Field'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _addressControllers.length,
              itemBuilder: (context, index) {
                return TextFormField(
                  controller: _addressControllers[index],
                  decoration: InputDecoration(
                    labelText: 'Address ${index++}',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _addressControllers.length < 3
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _addressControllers.add(TextEditingController());
                });
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  @override
  void dispose() {
    for (var controller in _addressControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
