import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date range picker'),
      ),
      body: Center(
        child: SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(selectedDate ?? 'Please select dates'),
                const SizedBox(
                  height: 10,
                ),
                _buildCalendarDialogButton(),
              ],
            )
            // ListView(
            //   children: <Widget>[
            //     _buildCalendarDialogButton(),
            //     _buildDefaultSingleDatePickerWithValue(),
            //     _buildDefaultMultiDatePickerWithValue(),
            //     _buildDefaultRangeDatePickerWithValue(),
            //     _buildCalendarWithActionButtons(),
            //   ],
            // ),
            ),
      ),
    );
  }

  String dateFormate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String? getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : null;
        valueText = '$startDate to $endDate';
      } else {
        return null;
      }
    }

    return valueText;
  }

  Widget _buildCalendarDialogButton() {
    const dayTextStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final config = CalendarDatePicker2WithActionButtonsConfig(
      firstDate: DateTime(2012),
      lastDate: DateTime(2030),
      // calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.purple[800],
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Color.fromARGB(255, 224, 18, 18),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        // if (date.weekday == DateTime.saturday ||
        //     date.weekday == DateTime.sunday) {
        //   textStyle = weekendTextStyle;
        // }
        if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
          textStyle = anniversaryTextStyle;
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        // if (date.day % 3 == 0 && date.day % 9 != 0) {
        //   dayWidget = Container(
        //     decoration: decoration,
        //     child: Center(
        //       child: Stack(
        //         alignment: AlignmentDirectional.center,
        //         children: [
        //           Text(
        //             MaterialLocalizations.of(context).formatDecimal(date.day),
        //             style: textStyle,
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(top: 27.5),
        //             child: Container(
        //               height: 4,
        //               width: 4,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(5),
        //                 color: isSelected == true
        //                     ? Colors.white
        //                     : Colors.grey[500],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   );
        // }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: textStyle,
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final values = await showCalendarDatePicker2Dialog(
                context: context,
                config: config,
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
                // value: _dialogCalendarPickerValue,
                dialogBackgroundColor: Colors.white,
              );
              if (values != null) {
                // ignore: avoid_print
                print('xxx: _getValueText ${getValueText(
                  config.calendarType,
                  values,
                )}');
                setState(() {
                  if (getValueText(
                    config.calendarType,
                    values,
                  )!
                      .contains('null')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                            label: 'Cancel',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            }),
                        content: const Text('Please select To date'),
                      ),
                    );
                  } else {
                    selectedDate = getValueText(
                      config.calendarType,
                      values,
                    );
                  }
                });
              }
            },
            child: const Text('Open Calendar Dialog'),
          ),
        ],
      ),
    );
  }

  // Widget _buildDefaultSingleDatePickerWithValue() {
  //   final config = CalendarDatePicker2Config(
  //     selectedDayHighlightColor: Colors.amber[900],
  //     weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
  //     weekdayLabelTextStyle: const TextStyle(
  //       color: Colors.black87,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     firstDayOfWeek: 1,
  //     controlsHeight: 50,
  //     controlsTextStyle: const TextStyle(
  //       color: Colors.black,
  //       fontSize: 15,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     dayTextStyle: const TextStyle(
  //       color: Colors.amber,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     disabledDayTextStyle: const TextStyle(
  //       color: Colors.grey,
  //     ),
  //     centerAlignModePicker: true,
  //     useAbbrLabelForMonthModePicker: true,
  //     firstDate: DateTime(DateTime.now().year - 2, DateTime.now().month - 1,
  //         DateTime.now().day - 5),
  //     lastDate: DateTime(DateTime.now().year + 3, DateTime.now().month + 2,
  //         DateTime.now().day + 10),
  //     selectableDayPredicate: (day) => !day
  //         .difference(DateTime.now().subtract(const Duration(days: 3)))
  //         .isNegative,
  //   );
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       const SizedBox(height: 10),
  //       const Text('Single Date Picker (With default value)'),
  //       CalendarDatePicker2(
  //         config: config,
  //         value: _singleDatePickerValueWithDefaultValue,
  //         onValueChanged: (dates) =>
  //             setState(() => _singleDatePickerValueWithDefaultValue = dates),
  //       ),
  //       const SizedBox(height: 10),
  //       Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const Text('Selection(s):  '),
  //           const SizedBox(width: 10),
  //           Text(
  //             _getValueText(
  //               config.calendarType,
  //               _singleDatePickerValueWithDefaultValue,
  //             ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 25),
  //     ],
  //   );
  // }

  // Widget _buildDefaultMultiDatePickerWithValue() {
  //   final config = CalendarDatePicker2Config(
  //     disableMonthPicker: true,
  //     calendarType: CalendarDatePicker2Type.multi,
  //     selectedDayHighlightColor: Colors.indigo,
  //   );
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       const SizedBox(height: 10),
  //       const Text('Multi Date Picker (With default value)'),
  //       CalendarDatePicker2(
  //         config: config,
  //         value: _multiDatePickerValueWithDefaultValue,
  //         onValueChanged: (dates) =>
  //             setState(() => _multiDatePickerValueWithDefaultValue = dates),
  //       ),
  //       const SizedBox(height: 10),
  //       Wrap(
  //         children: [
  //           const Text('Selection(s):  '),
  //           const SizedBox(width: 10),
  //           Text(
  //             _getValueText(
  //               config.calendarType,
  //               _multiDatePickerValueWithDefaultValue,
  //             ),
  //             overflow: TextOverflow.ellipsis,
  //             maxLines: 1,
  //             softWrap: false,
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 25),
  //     ],
  //   );
  // }

  // Widget _buildDefaultRangeDatePickerWithValue() {
  //   final config = CalendarDatePicker2Config(
  //     calendarType: CalendarDatePicker2Type.range,
  //     selectedDayHighlightColor: Colors.teal[800],
  //     weekdayLabelTextStyle: const TextStyle(
  //       color: Colors.black87,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     controlsTextStyle: const TextStyle(
  //       color: Colors.black,
  //       fontSize: 15,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       const SizedBox(height: 10),
  //       const Text('Range Date Picker (With default value)'),
  //       CalendarDatePicker2(
  //         config: config,
  //         value: _rangeDatePickerValueWithDefaultValue,
  //         onValueChanged: (dates) =>
  //             setState(() => _rangeDatePickerValueWithDefaultValue = dates),
  //       ),
  //       const SizedBox(height: 10),
  //       Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const Text('Selection(s):  '),
  //           const SizedBox(width: 10),
  //           Text(
  //             _getValueText(
  //               config.calendarType,
  //               _rangeDatePickerValueWithDefaultValue,
  //             ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 25),
  //     ],
  //   );
  // }

  // Widget _buildCalendarWithActionButtons() {
  //   final config = CalendarDatePicker2WithActionButtonsConfig(
  //     calendarType: CalendarDatePicker2Type.range,
  //     disableModePicker: true,
  //   );
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       const SizedBox(height: 10),
  //       const Text('Date Picker With Action Buttons'),
  //       CalendarDatePicker2WithActionButtons(
  //         config: config,
  //         value: _rangeDatePickerWithActionButtonsWithValue,
  //         onValueChanged: (dates) => setState(
  //             () => _rangeDatePickerWithActionButtonsWithValue = dates),
  //       ),
  //       const SizedBox(height: 10),
  //       Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const Text('Selection(s):  '),
  //           const SizedBox(width: 10),
  //           Flexible(
  //             child: Text(
  //               _getValueText(
  //                 config.calendarType,
  //                 _rangeDatePickerWithActionButtonsWithValue,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 25),
  //     ],
  //   );
  // }
}
