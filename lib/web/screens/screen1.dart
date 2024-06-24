import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_flutter/web/utilities/constants.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Center(
              child: Icon(
                Icons.person,
                size: 400,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 16)
                  .copyWith(top: size.height * 0.24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 5.3,
                        child: const Text(
                          'Hello, I’m David Petrix, UX/UI designer and front-end developer based in san francisco.',
                          style: Constants.txW6F18Cb,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 130,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'test',
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: size.width * 0.089,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.home),
                      // ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.022,
                            height: size.height / 11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.arrow_downward_rounded),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            'Scroll\nDown',
                            style: Constants.txW6F18Cb,
                          ),
                        ],
                      ),
                      SizedBox(
                        // width: 400,
                        width: size.width / 5.22,
                        child: const Text(
                          'Feel Free to send me a message if you want to enhance your recruitment. \nFacebook . Twitter . Linkedin . Dribbble',
                          // style: TextStyle(
                          //     fontFamily: 'Sora',
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 20),
                          style: Constants.txW6F18Cb,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 7.2,
                    // height: 120,
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     width: size.width,
          //     height: 100,
          //     color: Colors.black,
          //   ),
          // )

          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'This is ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: size.width * 0.089,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'Center',
                  style: TextStyle(
                    // color: Colors.transparent,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    fontSize: size.width * 0.089,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.5
                      ..color = Colors.black,
                  ),

                  // TextStyle(
                  //         color: Colors.white,
                  //         fontSize: size.width * 0.089,
                  //         fontWeight: FontWeight.bold)
                  //     .copyWith(
                  //   foreground: Paint()
                  //     ..style = PaintingStyle.stroke
                  //     ..strokeWidth = 0.1
                  //     ..color = Colors.red,
                  // ),
                ),
                Text(
                  ' text',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.089,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
