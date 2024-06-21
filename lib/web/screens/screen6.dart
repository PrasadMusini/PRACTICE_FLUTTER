import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.6,
      color: const Color(0xFFe2eaf5),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.152, vertical: (size.height / 2) * 0.14),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.gpp_maybe_rounded),
                    SizedBox(width: 10),
                    Text(
                      'My Education',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 240, 247),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 235, 240, 247),
                          width: 0.4),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        informationBox('2015 - 2017', 'Programming Course',
                            'Harvard University'),
                        informationBox('2015 - 2017', 'Programming Course',
                            'Harvard University'),
                        informationBox('2015 - 2017', 'Programming Course',
                            'Harvard University'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.gpp_maybe_rounded),
                    SizedBox(width: 10),
                    Text(
                      'My Experience',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 240, 247),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 235, 240, 247),
                          width: 0.4),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        informationBox('2015 - 2017', 'Programming Course',
                            'Harvard University'),
                        informationBox('2015 - 2017', 'Programming Course',
                            'Harvard University'),
                        informationBox('2015 - 2017', 'Programming Course',
                            'Harvard University'),
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

  Container informationBox(String dates, String content, String subContent) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              child: Text(
            dates, //'2015 - 2017',
            style: const TextStyle(
                color: Color(0XFFe87765),
                fontSize: 16,
                fontWeight: FontWeight.bold),
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
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subContent,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
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
