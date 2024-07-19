import 'package:flutter/material.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  const ProfileOption({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '$title Not available ',
          style: Styles.txStyF12FW3FFsCb,
        ),
      ),
    );
  }
}
