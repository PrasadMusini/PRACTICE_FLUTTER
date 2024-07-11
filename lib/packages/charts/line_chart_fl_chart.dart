import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Student {
  final String name;
  final int age;
  final double percentage;
  final String studentClass;

  Student(
      {required this.name,
      required this.age,
      required this.percentage,
      required this.studentClass});
}

class LinesChartTest extends StatelessWidget {
  LinesChartTest({super.key});

  final List<Student> students = [
    Student(name: 'John', age: 15, percentage: 85, studentClass: '10th'),
    Student(name: 'Emma', age: 16, percentage: 90, studentClass: '11th'),
    Student(name: 'Sophia', age: 14, percentage: 95, studentClass: '9th'),
    Student(name: 'James', age: 17, percentage: 80, studentClass: '12th'),
    Student(name: 'Olivia', age: 15, percentage: 92, studentClass: '10th'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Percentage Line Chart'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        value.toInt();
                        // if (index >= 0 && index < students.length) {
                        //   return Text(students[index].name);
                        // }
                        return const Text('test');
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
                  ),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: students
                        .asMap()
                        .entries
                        .map((entry) => FlSpot(
                            entry.key.toDouble(), entry.value.percentage))
                        .toList(),
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 4,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
