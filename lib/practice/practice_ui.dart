import 'package:flutter/material.dart';

class PracticeUI extends StatefulWidget {
  const PracticeUI({super.key});

  @override
  State<PracticeUI> createState() => _PracticeUIState();
}

class _PracticeUIState extends State<PracticeUI> {
  final style = const TextStyle(
    fontSize: 12,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
      onTap: () {
        openDialog(context);
      },
      child: Text('Sample text',
          style: style.copyWith(
            fontSize: 25,
            letterSpacing: 2,
          )),
    )));
  }

  void openDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: 'barrierLabel',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
    );
  }
}
