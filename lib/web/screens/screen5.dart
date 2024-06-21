import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.4,
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.152,
      ),
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        awardsLayer(),
        awardsLayer(),
        awardsLayer(),
        awardsLayer(),
        const Divider(color: Color.fromARGB(255, 80, 80, 80)),
      ]),
    );
  }

  Column awardsLayer() {
    return const Column(
      children: [
        Divider(color: Color.fromARGB(255, 80, 80, 80)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Site Of The Day',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'CSS & Animation',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '2018',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
