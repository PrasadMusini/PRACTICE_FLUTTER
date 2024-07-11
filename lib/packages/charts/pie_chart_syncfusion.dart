import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartExample extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Task 1', 20, Colors.blue),
    ChartData('Task 2', 30, Colors.green),
    ChartData('Task 3', 25, Colors.orange),
    ChartData('Task 4', 15, Colors.red),
    ChartData('Task 5', 10, Colors.purple),
  ];

  PieChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart Example'),
      ),
      body: SizedBox(
        height: 300,
        child: SfCircularChart(
          series: <CircularSeries>[
            PieSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}
