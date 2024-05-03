import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_loading_button/progress_loading_button.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoadingProgressBar extends StatefulWidget {
  const LoadingProgressBar({super.key});

  @override
  State<LoadingProgressBar> createState() => _LoadingProgressBarState();
}

class _LoadingProgressBarState extends State<LoadingProgressBar> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(const Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingButton(
              defaultWidget: const Text('Click Me'),
              width: 196,
              height: 60,
              onPressed: () async {
                await Future.delayed(
                  const Duration(milliseconds: 3000),
                  () {
                    print('Button Pressed');
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedLoadingButton(
              controller: _btnController,
              onPressed: _doSomething,
              borderRadius: 100,
              loaderSize: 25,
              valueColor: Colors.red,
              child:
                  const Text('Tap me!', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}


//  RoundedLoadingButton(
//                                     controller: _loginBtnController,
//                                     onPressed: loginUser,
//                                     color: CommonUtils.primaryTextColor,
//                                     borderRadius: 10,
//                                     loaderSize: 25,
//                                     valueColor: Colors.red,
//                                     child: const Text('Login',
//                                         style: TextStyle(color: Colors.white)),
//                                   ),