import 'package:flutter/material.dart';
import 'package:practice_flutter/imports.dart';

class Screen14 extends StatelessWidget {
  const Screen14({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          width: size.width,
          height: size.height * 0.15,
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: size.height * 0.14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Copyright © 2024 Petrix. All rights reserved.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Row(
                children: [
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                width: (size.height * 0.14) * 0.5,
                height: (size.height * 0.14) * 0.7,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              )
            ],
          )),
    );
  }
}
