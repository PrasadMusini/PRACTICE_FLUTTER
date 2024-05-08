import 'package:flutter/material.dart';
import 'package:practice_flutter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChange extends StatelessWidget {
  const ThemeChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: MyBox(child: MyButton(
          onPressed: () {
            print('Clicked!');
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
        )),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  const MyButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: const Text('Change theme'),
    );
  }
}

class MyBox extends StatelessWidget {
  final Widget child;
  const MyBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: child,
    );
  }
}
