import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileScreen9 extends StatelessWidget {
  const MobileScreen9({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.8,
        color: const Color(0xfffae8e0),
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 7, vertical: size.height * 0.1),
        // padding: EdgeInsets.symmetric(
        //     horizontal: size.width * 0.187, vertical: size.height * 0.14),
        // alignment: Alignment.center,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          width: size.width,
          height: size.height / 1.8, // size.height / 1.8,
          child: Row(
            children: [
              const SizedBox(
                width: 50,
                child: Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'prev',
                                  style: Constants.txW5FpCb,
                                )),
                            SizedBox(height: 10),
                            Icon(
                              Icons.arrow_downward_outlined,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                        child: Divider(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_upward_outlined,
                              size: 15,
                            ),
                            SizedBox(height: 10),
                            RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'next',
                                  style: Constants.txW5FpCb,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 0.5,
                color: Colors.black26,
              ),
              Expanded(
                child: profileCard(size),
              ), // Expanded(child: Container(color: Colors.blue,))
            ],
          ),
        )
        // Column(
        //   children: [
        //     Container(
        //       padding: const EdgeInsets.symmetric(vertical: 30),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           const Text(
        //             'Contact Us',
        //             style: TextStyle(
        //               fontSize: 30,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           Container(
        //             padding: const EdgeInsets.all(10),
        //             decoration: BoxDecoration(
        //               color: Colors.black,
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //             child: const Icon(
        //               Icons.remove_red_eye,
        //               size: 28,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }

  Container profileCard(Size size) {
    return Container(
        padding: EdgeInsets.all(
          (size.height / 1.8) / 10,
        ), // color: Colors.blue,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.stream,
                      size: 25,
                    ),
                    // Spacer(),
                    Text(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable but also the leap into electronic typesetting, remaining essentially unchanged',
                      // style: TextStyle(
                      //   fontSize: 24,
                      //   height: 2,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      style: Constants.txW7FpCb.copyWith(
                        fontSize: size.width * 0.013,
                        height: 1.6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Developer Name',
                          style: Constants.txW8FsCb.copyWith(
                            fontSize: size.width * 0.015,
                          ),
                          // style: TextStyle(
                          //   fontSize: 24,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                        Text(
                          'Description',
                          style: Constants.txW7FpCb.copyWith(
                              fontSize: (size.width * 0.016) / 2,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                          // style: TextStyle(
                          //   fontSize: 12,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
