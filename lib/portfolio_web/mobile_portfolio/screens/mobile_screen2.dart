import 'package:flutter/material.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';

class MobileScreen2 extends StatelessWidget {
  final String content;
  final Color backgroundColor;
  const MobileScreen2(
      {super.key, required this.content, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60, // height: size.height * 0.16,
      color: backgroundColor,
      alignment: Alignment.center,
      child: InfiniteMarquee(
        frequency: const Duration(milliseconds: 70),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Text(
                '$content ',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: size.width * 0.043,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                '$content ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: size.width * 0.043,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 0.5
                    ..color = Colors.white,
                ),
              ),
            ],
          );
        },
      ),

      //  Marquee(
      //   duration: const Duration(milliseconds: 5000),
      //   child: Row(
      //     children: [
      //       Text(
      //         '$content ',
      //         style: TextStyle(
      //             fontFamily: 'Poppins',
      //             color: Colors.black,
      //             fontSize: size.height * 0.089,
      //             fontWeight: FontWeight.w900),
      //       ),
      //       Text(
      //         '$content ',
      //         style: TextStyle(
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w900,
      //           fontSize: size.height * 0.089,
      //           foreground: Paint()
      //             ..style = PaintingStyle.stroke
      //             ..strokeWidth = 0.5
      //             ..color = Colors.black,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // child: Marquee(
      //   text: content,
      //   style: TextStyle(
      //       // color: Colors.white,
      //       // fontWeight: FontWeight.bold,
      //       // fontSize: (size.height * 0.14) / 2,
      //       fontFamily: 'Poppins',
      //       color: Colors.black,
      //       fontSize: size.width * 0.089,
      //       fontWeight: FontWeight.w900),
      // ),
    );
  }
}
