import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PracticeFlutter extends StatefulWidget {
  const PracticeFlutter({super.key});

  @override
  State<PracticeFlutter> createState() => _PracticeFlutterState();
}

class _PracticeFlutterState extends State<PracticeFlutter> {
//   DateTimeRange datesRange =
//       DateTimeRange(start: DateTime(1999), end: DateTime.now());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               datesRange.duration.inDays.toString(),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: showDateRange,
//               child: const Text('showDateRangePicker'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: showDatePicker,
//               child: const Text('showDatePickerDialog'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void showDateRange() async {
//     DateTimeRange? range = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2024, 5, 1),
//       lastDate: DateTime.now(),
//     );

//     if (range != null) {
//       setState(() {
//         datesRange = range;
//       });
//     }
//   }

//   void showDatePicker() async {
//     // final date = await showDatePickerDialog(
//     //   context: context,
//     //   minDate: DateTime(2021, 1, 1),
//     //   maxDate: DateTime(2023, 12, 31),
//     // );
//     final date = await showDatePickerDialog(
//       context: context,
//       initialDate: DateTime(2022, 10, 10),
//       minDate: DateTime(2020, 10, 10),
//       maxDate: DateTime(2024, 10, 30),
//       width: 300,
//       height: 300,
//       currentDate: DateTime(2022, 10, 15),
//       selectedDate: DateTime(2022, 10, 16),
//       currentDateDecoration: const BoxDecoration(),
//       currentDateTextStyle: const TextStyle(),
//       daysOfTheWeekTextStyle: const TextStyle(),
//       disabledCellsTextStyle: const TextStyle(),
//       enabledCellsDecoration: const BoxDecoration(),
//       enabledCellsTextStyle: const TextStyle(),
//       initialPickerType: PickerType.days,
//       selectedCellDecoration: const BoxDecoration(),
//       selectedCellTextStyle: const TextStyle(),
//       leadingDateTextStyle: const TextStyle(),
//       slidersColor: Colors.lightBlue,
//       highlightColor: Colors.redAccent,
//       slidersSize: 20,
//       splashColor: Colors.lightBlueAccent,
//       splashRadius: 40,
//       centerLeadingDate: true,
//     );
//   }
// }

  DateTime? _startDate;
  DateTime? _endDate;
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate = args.value.start!;
      _endDate = args.value.end!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              view: DateRangePickerView.month,
              controller: _dateRangePickerController,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "Selected From: ${_startDate?.toString().split(' ').first}"),
                Text("To: ${_endDate?.toString().split(' ').last}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
