import 'package:chart_app/models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class ChartWidget extends StatelessWidget {
  final List<ChartData> data;

  const ChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Convert ChartData to chart series
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
        id: 'Doctors',
        data: data,
        domainFn: (ChartData chartData, _) => chartData.cityName,
        measureFn: (ChartData chartData, _) => chartData.doctorCount,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (ChartData chartData, _) =>
        chartData.doctorCount.toString(),
      )
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Number of Doctors in Cities',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
              barRendererDecorator: charts.BarLabelDecorator<String>(),
              domainAxis: const charts.OrdinalAxisSpec(),
              behaviors: [
                charts.ChartTitle('Cities',
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
                charts.ChartTitle('Number of Doctors',
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
