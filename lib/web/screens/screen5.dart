import 'package:flutter/material.dart';
import 'package:practice_flutter/web/utilities/constants.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.8,
      color: Colors.black,
      padding: EdgeInsets.symmetric(
          // horizontal: size.width * 0.152,
          horizontal: size.width / 16),
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        awardsLayer(size),
        awardsLayer(size),
        awardsLayer(size),
        awardsLayer(size),
        const Divider(color: Color.fromARGB(255, 80, 80, 80)),
      ]),
    );
  }

  Column awardsLayer(Size size) {
    return Column(
      children: [
        const Divider(color: Color.fromARGB(255, 80, 80, 80)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Site Of The Day',
                // style: Constants.txW5FpCw.copyWith(
                //   fontSize: size.width * 0.01,
                // ),
                style: Constants.txW6F18Cb.copyWith(
                  fontSize: size.width * 0.014,
                  color: Colors.white,
                ),
              ),
              Text(
                'CSS & Animation',
                style: Constants.txW6F18Cb.copyWith(
                  fontSize: size.width * 0.014,
                  color: Colors.white,
                ),
              ),
              Text(
                '2018',
                style: Constants.txW6F18Cb.copyWith(
                  fontSize: size.width * 0.014,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
