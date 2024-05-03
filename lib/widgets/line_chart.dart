import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart Sample'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: LineChart(
                LineChartData(
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 6),
                          FlSpot(1, 1),
                          FlSpot(2, 4),
                          FlSpot(3, 2),
                          FlSpot(4, 5),
                          FlSpot(5, 2),
                          FlSpot(6, 6),
                        ],
                        isCurved: true,
                        color: Colors.blueAccent,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 0),
                          FlSpot(1, 1),
                          FlSpot(2, 0),
                          FlSpot(3, 5),
                          FlSpot(4, 5),
                          FlSpot(5, 1),
                          FlSpot(6, 4),
                        ],
                        isCurved: true,
                        color: Colors.greenAccent,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(1, 4),
                          FlSpot(2, 6),
                          FlSpot(3, 2),
                          FlSpot(4, 0),
                          FlSpot(5, 3),
                          FlSpot(6, 6),
                        ],
                        isCurved: true,
                        color: Colors.pinkAccent,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    borderData: FlBorderData(show: true),
                    gridData: const FlGridData(show: true),
                    titlesData: const FlTitlesData(leftTitles: AxisTitles())),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LineChartSample(),
  ));
}
