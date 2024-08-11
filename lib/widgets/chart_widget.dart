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
        id: 'Crude Oil',
        data: data,
        domainFn: (ChartData chartData, _) => chartData.refineryName,
        measureFn: (ChartData chartData, _) => chartData.crudeOilProcessed,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (ChartData chartData, _) =>
            chartData.crudeOilProcessed.toString(),
      )
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Monthly Crude Oil Processed by Refineries',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
              barRendererDecorator: charts.BarLabelDecorator<String>(),
              domainAxis: const charts.OrdinalAxisSpec(),
              behaviors: [
                charts.ChartTitle('Refineries',
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
                charts.ChartTitle('Crude Oil Processed (MT)',
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
