import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileScreen5 extends StatelessWidget {
  const MobileScreen5({super.key});

  static final List<Certification> cartifications = [
    Certification(course: 'Java', institute: 'Jspiders', dates: '2022'),
    Certification(
        course: 'Web Development', institute: 'Jspiders', dates: '2022'),
    Certification(course: 'SQL', institute: 'Jspiders', dates: '2022'),
    Certification(course: 'Angular', institute: 'self', dates: '2022'),
    Certification(course: 'Springboot', institute: 'self', dates: '2022'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 500,
      color: Colors.black,
      padding: EdgeInsets.symmetric(
          // horizontal: size.width * 0.152,
          horizontal: size.width * 0.06),
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        awardsLayer(size, cartifications[0]),
        awardsLayer(size, cartifications[1]),
        awardsLayer(size, cartifications[2]),
        awardsLayer(size, cartifications[3]),
        awardsLayer(size, cartifications[4]),
        const Divider(color: Color.fromARGB(255, 80, 80, 80)),
      ]),
    );
  }

  Column awardsLayer(Size size, Certification certification) {
    return Column(
      children: [
        const Divider(color: Color.fromARGB(255, 80, 80, 80)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  certification.course, // 'Site Of The Day',
                  style: Constants.txW6F18Cw,
                  // style: Constants.txW6F18Cb.copyWith(
                  //   fontSize: 12,
                  //   color: Colors.white,
                  // ),
                ),
              ),
              Text(
                certification.institute, // 'CSS & Animation',
                style: Constants.txW6F18Cw,
              ),
              /*   const SizedBox(width: 50),
              Text(
                certification.dates, // '2018',
                style: Constants.txW6F18Cw,
              ), */
            ],
          ),
        ),
      ],
    );
  }
}

class Certification {
  final String course;
  final String institute;
  final String dates;
  Certification(
      {required this.course, required this.institute, required this.dates});
}
