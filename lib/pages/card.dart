import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 4 and 6
              const Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text('BRANCH NAME'),
                        ],
                      ),
                      // row1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: Text('Title')),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text('Title'),
                                  ],
                                )),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // row2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: Text('Title')),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text('Title'),
                                  ],
                                )),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // 11 (feedback)
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        children: [
                          Text('BRANCH NAME'),
                        ],
                      ),
                      // row1
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: Text('Title')),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text('Title'),
                                  ],
                                )),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // row2
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: Text('Title')),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text('Title'),
                                  ],
                                )),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': Data'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // rating
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: Text('Rating')),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(': *****'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // feedback
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Feedback : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'This is very very very very very very very very very very very very very very very very very very very very big text',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        children: [
                          Text('BRANCH NAME'),
                        ],
                      ),
                      // row1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text('Title')),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(': Data'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text('Title')),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(': Data'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text('Title')),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(': Data'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text('Title')),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(': Data'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),

                          // button
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Cancel'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // // row2
                      // const Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       child: Row(
                      //         children: [
                      //           Expanded(child: Text('Title')),
                      //           Expanded(
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               children: [
                      //                 Text(': Data'),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Expanded(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //               child: Row(
                      //             children: [
                      //               Text('Title'),
                      //             ],
                      //           )),
                      //           Expanded(
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               children: [
                      //                 Text(': Data'),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      // // rating
                      // const Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       child: Row(
                      //         children: [
                      //           Expanded(child: Text('Rating')),
                      //           Expanded(
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               children: [
                      //                 Text(': *****'),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Expanded(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 SizedBox(),
                      //               ],
                      //             ),
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 SizedBox(),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      // // feedback
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: RichText(
                      //         text: const TextSpan(
                      //           children: <TextSpan>[
                      //             TextSpan(
                      //               text: 'Feedback : ',
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //             TextSpan(
                      //               text:
                      //                   'This is very very very very very very very very very very very very very very very very very very very very big text',
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YourCard extends StatelessWidget {
  const YourCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College Card'),
      ),
      body: const Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('COLLEGE NAME',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Class: Data'),
                  Text('Age: Data'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('College: Data'),
                  Text('Marks: Data'),
                ],
              ),
              SizedBox(height: 10),
              Text('Rating: ****'),
              SizedBox(height: 10),
              Text('Feedback: This is very very big text'),
            ],
          ),
        ),
      ),
    );
  }
}
