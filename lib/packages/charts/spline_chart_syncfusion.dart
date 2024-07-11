import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineAreaChartExample extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData(1, 30),
    ChartData(2, 28),
    ChartData(3, 34),
    ChartData(4, 32),
    ChartData(5, 40),
    ChartData(6, 38),
    ChartData(7, 36),
  ];

  SplineAreaChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spline Area Chart Example'),
      ),
      body: Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: SfCartesianChart(
          primaryXAxis: const NumericAxis(),
          series: [
            SplineAreaSeries<ChartData, int>(
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.month,
              yValueMapper: (ChartData sales, _) => sales.sales,
              markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final int month;
  final double sales;

  ChartData(this.month, this.sales);
}
