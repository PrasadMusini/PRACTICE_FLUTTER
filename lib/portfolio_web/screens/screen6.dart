import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

// ignore: must_be_immutable
class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  static final List<User> userData = [
    User(
        dates: '2015 - 2017',
        course: 'Programming Course',
        university: 'Harvard University'),
    User(
        dates: '2018 - 2021',
        course: 'Programming Course',
        university: 'California University'),
    User(
        dates: '2021 - 2023',
        course: 'Computer Science',
        university: 'Stanford University'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.9,
      color: const Color(0xFFe2eaf5),
      padding: EdgeInsets.symmetric(horizontal: size.width / 16
          // horizontal: size.width * 0.152,
          ),
      // alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              educationTable(size, 'My Education', userData),
              const SizedBox(width: 20),
              educationTable(size, 'My Experience', userData),
            ],
          ),
        ],
      ),
    );
  }

  Expanded educationTable(Size size, String title, List<User> user) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.gpp_maybe_rounded),
              const SizedBox(width: 10),
              Text(
                title, // 'My Education',
                style: Constants.txW6F18Cb.copyWith(
                    fontSize: size.width * 0.018, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Card(
            // elevation: 6,
            color: const Color(0xFFe2eaf5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 236, 248),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 240, 237, 237), width: 1),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.black
                  //       .withOpacity(0.5), // Shadow color with opacity
                  //   offset: const Offset(0.4, 0.4), // Offset for X and Y (X, Y)
                  //   blurRadius: 10, // Blur radius
                  //   spreadRadius: 0.2, // Spread radius
                  // ),
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.1), // Lighter shadow color with low opacity
                    offset: const Offset(0, 4), // Offset for X and Y (X, Y)
                    blurRadius: 10, // Blur radius
                    spreadRadius: 2, // Spread radius
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  informationBox(
                      size, user[0].dates, user[0].course, user[0].university),
                  const Divider(
                    color: Color.fromARGB(255, 255, 255, 255),
                    thickness: 0.5,
                  ),
                  informationBox(
                      size, user[1].dates, user[1].course, user[1].university),
                  const Divider(
                    color: Color.fromARGB(255, 255, 255, 255),
                    thickness: 0.5,
                  ),
                  informationBox(
                      size, user[2].dates, user[2].course, user[2].university),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container informationBox(
      Size size, String dates, String content, String subContent) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              child: Text(
            dates, //'2015 - 2017',
            // style: Constants.txW6F18Cb.copyWith(
            //   fontSize: size.width * 0.014,
            // ),
            style: Constants.txW7FsCo.copyWith(
              fontSize: size.width * 0.014,
            ),
            // style: const TextStyle(
            //     color: Color(0XFFea552b),
            //     fontSize: 16,
            //     fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      style: Constants.txW7FpCb.copyWith(
                        fontSize: size.width * 0.014,
                      ),
                      // style: Constants.txW5FpCw.copyWith(
                      //     fontSize: size.width * 0.01, color: Colors.black),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subContent,
                      style: Constants.txW4FsCb38.copyWith(
                        fontSize: size.width * 0.01,
                      ),
                      // style: Constants.txW5FpCw.copyWith(
                      //     fontSize: size.width * 0.0065, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class User {
//   final String dates;
//   final String course;
//   final String university;
//   User({required this.dates, required this.course, required this.university});
// }

class User {
  final String dates;
  final String course;
  final String university;
  User({required this.dates, required this.course, required this.university});
}
