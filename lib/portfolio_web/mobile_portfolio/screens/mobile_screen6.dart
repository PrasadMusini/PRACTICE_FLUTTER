import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

// ignore: must_be_immutable
class MobileScreen6 extends StatelessWidget {
  const MobileScreen6({super.key});

  static final List<User> userData = [
    User(
        percentage: '72%',
        dates: '2018 - 2021',
        course: 'Bachelor of Computer Applications',
        university: 'Krishna University'),
    User(
        percentage: '66%',
        dates: '2015 - 2017',
        course: 'MPC',
        university: 'VJ Junior College'),
    User(
        percentage: '65%',
        dates: '2014 - 2015',
        course: 'SSC',
        university: 'Sri Chaithaya'),
  ];
  static final List<Data> experienceData = [
    Data(
        mainData: 'Java Full Stack Developer',
        sub1Data: 'Nexgile Technologies',
        sub2Data: '2022 - 2023'),
    Data(
        mainData: 'Flutter Developer',
        sub1Data: 'Calibrage Info Systems',
        sub2Data: '2023 - present'),
    Data(mainData: 'mainData', sub1Data: 'sub1Data', sub2Data: 'sub2Data')
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      // color: const Color.fromARGB(255, 237, 134, 134),
      color: const Color(0xFFe2eaf5),
      padding: const EdgeInsets.symmetric(
        horizontal: 12, vertical: 20,
        // horizontal: size.width * 0.152,
      ),
      // alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          educationTable(size, 'My Education', userData),
          const SizedBox(height: 50),
          experienceTable(size, 'My Experience', experienceData),
        ],
      ),
    );
  }

  Widget educationTable(Size size, String title, List<User> user) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.gpp_maybe_rounded),
            const SizedBox(width: 10),
            Text(
              title, // 'My Education',
              style: Constants.txW6F18Cb
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
                educationInformationBox(size, user[0].dates, user[0].course,
                    user[0].university, user[0].percentage),
                const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  thickness: 0.5,
                ),
                educationInformationBox(size, user[1].dates, user[1].course,
                    user[1].university, user[1].percentage),
                const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  thickness: 0.5,
                ),
                educationInformationBox(size, user[2].dates, user[2].course,
                    user[2].university, user[2].percentage),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget experienceTable(Size size, String title, List<Data> data) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.gpp_maybe_rounded),
            const SizedBox(width: 10),
            Text(
              title, // 'My Education',
              style: Constants.txW6F18Cb
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
                experienceInformationBox(data[0]),
                const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  thickness: 0.5,
                ),
                experienceInformationBox(data[1]),
                /*  const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  thickness: 0.5,
                ),
                experienceInformationBox(data[2]), */
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container educationInformationBox(Size size, String dates, String content,
      String subContent, String percentage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Constants.txW7FpCb.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subContent,
                  style: Constants.txW4FsCb38.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                dates,
                style: Constants.txW7FsCo.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                percentage,
                style: Constants.txW7FpCb.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container experienceInformationBox(Data data) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.mainData,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Constants.txW7FpCb.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  data.sub1Data,
                  style: Constants.txW4FsCb38.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            data.sub2Data,
            style: Constants.txW7FsCo.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
