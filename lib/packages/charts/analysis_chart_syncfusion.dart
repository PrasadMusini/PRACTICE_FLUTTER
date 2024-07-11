import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StudentPerformance {
  final String studentName;
  final int marks;
  final Color color;

  StudentPerformance(this.studentName, this.marks, this.color);
}

class AnalysisChat extends StatefulWidget {
  const AnalysisChat({Key? key}) : super(key: key);

  @override
  State<AnalysisChat> createState() => _AnalysisChatState();
}

class _AnalysisChatState extends State<AnalysisChat> {
  late TooltipBehavior _tooltipbehavior;

  @override
  void initState() {
    _tooltipbehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Sample student performance data
    final List<StudentPerformance> studentsData = [
      StudentPerformance('Alice', 85, Colors.blue),
      StudentPerformance('Bob', 70, Colors.orange),
      StudentPerformance('Charlie', 60, Colors.green),
      StudentPerformance('David', 75, Colors.red),
    ];

    return SizedBox(
      height: 300,
      width: 300,
      child: SfCircularChart(
        tooltipBehavior: _tooltipbehavior,
        series: <CircularSeries>[
          DoughnutSeries<StudentPerformance, String>(
            dataSource: studentsData,
            xValueMapper: (StudentPerformance data, _) => data.studentName,
            yValueMapper: (StudentPerformance data, _) => data.marks,
            pointColorMapper: (StudentPerformance data, _) => data.color,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              alignment: ChartAlignment.center,
              margin: const EdgeInsets.all(8),
              overflowMode: OverflowMode.shift,
              connectorLineSettings: const ConnectorLineSettings(
                length: '10%',
                color: Colors.purple,
              ),
              textStyle: GoogleFonts.roboto(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            enableTooltip: true,
            explodeAll: true,
            innerRadius: '60%',
            explode: true,
            animationDelay: 1000,
            radius: '70%',
          ),
        ],
      ),
    );
  }
}
