import 'package:flutter/material.dart';

class CustomLoadingWid extends StatelessWidget {
  const CustomLoadingWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    customProgress(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customProgress() {
    return const LinearProgressIndicator(
      minHeight: 3,
      backgroundColor: Colors.transparent,
      // backgroundColor: Colors.grey.shade400,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    );
  }
}
