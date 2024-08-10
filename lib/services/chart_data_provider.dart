import 'package:chart_app/models/chart_data.dart';
import 'package:chart_app/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final chartDataProvider = FutureProvider<List<ChartData>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.fetchChartData();
});
