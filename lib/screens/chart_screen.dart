import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/chart_provider.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../models/chart_data.dart';

class ChartScreen extends ConsumerWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartDataAsyncValue = ref.watch(chartDataProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: const Text('Chart Screen', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: chartDataAsyncValue.when(
        data: (chartData) {
          return charts.BarChart(
            [
              charts.Series<ChartData, String>(
                id: 'Data',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (ChartData data, _) => data.category,
                measureFn: (ChartData data, _) => data.value,
                data: chartData,
              ),
            ],
            animate: true,
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
