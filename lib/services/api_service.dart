import 'dart:convert';
import 'package:chart_app/models/chart_data.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl =
      "https://api.data.gov.in/resource/8d3b6596-b09e-4077-aebf-425193185a5b?api-key=579b464db66ec23bdd0000016d8f25abae1041cb632f0af91477b5ee&format=json";

  Future<List<ChartData>> fetchChartData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Check if 'records' is a list and map it to ChartData
      if (data['records'] is List) {
        List<ChartData> chartData = List<ChartData>.from(
          data['records'].map((item) => ChartData.fromJson(item)),
        );
        return chartData;
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
