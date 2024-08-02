import 'package:chart_app/services/api_service.dart';
import 'package:chart_app/models/chart_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chartDataProvider = FutureProvider<List<ChartData>>((ref) async {
  final apiService = ApiService();
  final data = await apiService.fetchChartData();
  return data.map<ChartData>((json) => ChartData.fromJson(json)).toList();
});
