import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class CustomCalendarDialog extends StatefulWidget {
  final CalendarDatePicker2Config config;

  const CustomCalendarDialog({Key? key, required this.config})
      : super(key: key);

  @override
  State<CustomCalendarDialog> createState() => _CustomCalendarDialogState();
}

class _CustomCalendarDialogState extends State<CustomCalendarDialog> {
  List<DateTime?> _selectedDates = [null, null]; // Assuming range picker

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: CalendarDatePicker2(
                  config: widget.config,
                  value: _selectedDates,
                  onValueChanged: (dates) {
                    setState(() {
                      _selectedDates = dates;
                    });
                  },
                ),
              ),
            ),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed:
                        _selectedDates.length > 1 && _selectedDates[1] != null
                            ? () {
                                Navigator.of(context).pop(_selectedDates);
                              }
                            : null,
                    child: const Text('OK'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<List<DateTime?>?> showCustomCalendarDialog(
    BuildContext context, CalendarDatePicker2Config config) {
  return showDialog<List<DateTime?>?>(
    context: context,
    builder: (context) => CustomCalendarDialog(config: config),
  );
}
