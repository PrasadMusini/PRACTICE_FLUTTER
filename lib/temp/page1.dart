import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cardForSubmitted(),
            const SizedBox(
              height: 30,
            ),
            cardWithFeedback(),
          ],
        ),
      ),
    );
  }

  Widget cardForSubmitted() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // height: 120,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Aug'),
                    Text(
                      '10',
                      style: TextStyle(fontSize: 24, letterSpacing: 2),
                    ),
                    Text('1999'),
                  ],
                ),
                // const VerticalDivider(
                //   color: Colors.red,
                // ),
                Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.black,
                  height: 70,
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 93, 102, 230),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child:
//                        const Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text('10:00 Am'),
//                                     Text('Head Wash'),
//                                     Text('kondapur'),
//                                   ],
//                                 ),
                                    const Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text('10:00 Am'),
                                    Text('Head Wash'),
                                    Text('kondapur'),
                                  ],
                                ),
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('status'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.star_border_outlined,
                                      size: 13,
                                    ),
                                    Text('4.5'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        //MARK: Status Options
                        // Container(
                        //   padding: const EdgeInsets.only(top: 10),
                        //   child: const Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       // Flexible(
                        //       //   child: Text(
                        //       //     'Take a Card widget inside of that card, take a container with a radius of 10, and place your desired child inside the container Take a Card widget inside of that card, take a container with a radius of 10, and place your desired child inside the container.',
                        //       //     overflow: TextOverflow.ellipsis,
                        //       //     maxLines: 2,
                        //       //   ),
                        //       // ),
                        //       Text('Reschedule'),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text('Cancel appointment'),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text('Rate us'),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardWithFeedback() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // height: 120,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Aug'),
                    Text(
                      '10',
                      style: TextStyle(fontSize: 24, letterSpacing: 2),
                    ),
                    Text('1999'),
                  ],
                ),
                // const VerticalDivider(
                //   color: Colors.red,
                // ),
                Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.black,
                  height: 120,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('10:00 Am'),
                                Text('Head Wash'),
                                Text('kondapur'),
                                Text('kondapur'),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('status'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    size: 13,
                                  ),
                                  Text('4.5'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      //MARK: Status Options
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Flexible(
                            //   child: Text(
                            //     'Take a Card widget inside of that card, take a container with a radius of 10, and place your desired child inside the container Take a Card widget inside of that card, take a container with a radius of 10, and place your desired child inside the container.',
                            //     overflow: TextOverflow.ellipsis,
                            //     maxLines: 2,
                            //   ),
                            // ),
                            Text('Reschedule'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Cancel appointment'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Rate us'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
