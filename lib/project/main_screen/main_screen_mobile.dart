import 'package:flutter/material.dart';
import 'package:practice_flutter/imports.dart';
import 'package:practice_flutter/project/common_utilities/shared_prefs.dart';
import 'package:practice_flutter/project/signin/signin_mobile.dart';

class MainScreenMobile extends StatelessWidget {
  const MainScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            onPressed: () {
              SharedPrefsHelper.setLoginStatus();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SigninMobile()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const Center(
        child: Text('Main Screen'),
      ),
    );
  }
}
