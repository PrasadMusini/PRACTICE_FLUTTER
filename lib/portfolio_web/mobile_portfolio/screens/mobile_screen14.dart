import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileScreen14 extends StatelessWidget {
  const MobileScreen14({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          width: size.width,
          height: 60,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Developed in Flutter by Prasad Musini.',
                style: Constants.txW6F16Cb
                    .copyWith(color: Colors.grey, fontSize: 12),
                // style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              // Row(
              //   children: [
              //     Text(
              //       'Terms & Privacy Policy',
              //       style: Constants.txW6F13Cg,
              //     ),
              //   ],
              // ),
            ],
          )),
    );
  }
}
