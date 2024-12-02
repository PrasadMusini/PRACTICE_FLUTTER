import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PracticeFlutter extends StatefulWidget {
  const PracticeFlutter({super.key});

  @override
  State<PracticeFlutter> createState() => _PracticeFlutterState();
}

class _PracticeFlutterState extends State<PracticeFlutter> {
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
