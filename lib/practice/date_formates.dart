import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormates extends StatefulWidget {
  const DateFormates({super.key});

  @override
  State<DateFormates> createState() => _DateFormatesState();
}

class _DateFormatesState extends State<DateFormates> {
  void formates() {
    String inputDateStr = '2024-05-10T13:30:10';
    DateTime dateTime = DateTime.parse(inputDateStr);

    // Format 1: 10-05-2024
    String formattedDate1 = DateFormat('dd-MM-yyyy').format(dateTime);

    // Format 2: 2024-05-10
    String formattedDate2 = DateFormat('yyyy-MM-dd').format(dateTime);

    // Format 3: 10 May 2025
    String formattedDate3 = DateFormat('dd MMM yyyy').format(dateTime);

    // Format 4: fifth of may
    String formattedDate4 = DateFormat('d MMMM')
        .format(dateTime)
        .replaceAll('10', 'tenth')
        .replaceAll('11', 'eleventh')
        .replaceAll('12', 'twelfth')
        .replaceAllMapped(
            RegExp(r'\b\d\b'),
            (match) => [
                  'first',
                  'second',
                  'third',
                  'fourth',
                  'fifth',
                  'sixth',
                  'seventh',
                  'eighth',
                  'ninth'
                ][int.parse(match.group(0)!) - 1]);

    // Format 5: 01:30 PM
    String formattedDate5 = DateFormat('hh:mm a').format(dateTime);

    print('Format 1: $formattedDate1');
    print('Format 2: $formattedDate2');
    print('Format 3: $formattedDate3');
    print(
        'Format 4: $formattedDate4 of ${DateFormat('MMMM').format(dateTime)}');
    print('Format 5: $formattedDate5');
  }

  @override
  void initState() {
    super.initState();
    formates();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
