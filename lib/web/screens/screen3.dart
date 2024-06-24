import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_flutter/web/utilities/constants.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height -
            size.height * 0.14, // later subtract with header height
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.152, vertical: size.height * 0.14),
        color: const Color(0xfffae8e0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.grey.shade400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.stream_sharp,
                      size: size.width * 0.02,
                    ),
                    Text(
                      'Hello! I’m David Petrix. Web designer from USA, California, San Francisco. I have rich experience in web site design and building, lso I am good at wordpress. I love to talk with you about our unique.',
                      style: Constants.txW6F18Cb.copyWith(
                        // fontSize: 30,
                        fontSize: size.width * 0.016,
                        height: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '2+',
                              style: Constants.txW8FsCb.copyWith(
                                fontSize: size.height * 0.06,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Year of \nExperience',
                              style: Constants.txW6F16Cb,
                              // style: TextStyle(
                              //   fontSize: 18,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '2+',
                              style: Constants.txW8FsCb.copyWith(
                                fontSize: size.height * 0.06,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Year of \nExperience',
                              style: Constants.txW6F16Cb,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '2+',
                              style: Constants.txW8FsCb.copyWith(
                                fontSize: size.height * 0.06,
                              ),
                              // style: TextStyle(
                              //     fontFamily: 'Sora',
                              //     color: Colors.black,
                              //     fontSize: size.height * 0.06,
                              //     fontWeight: FontWeight.w800),
                              // style: TextStyle(
                              //   fontSize: 45,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Year of \nExperience',
                              style: Constants.txW6F18Cb,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child:
                          const Text('Download CV', style: Constants.txW6F18Cw),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
