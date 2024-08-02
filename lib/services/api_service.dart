import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // API is work only for 5 minutes (Don't Know why)
  static const String baseUrl = 'https://data.gov.in/resource/0cde42d3-5f49-4d2a-996c-4dfc4b2e2596';
  static const String apiKey = '579b464db66ec23bdd0000016d8f25abae1041cb632f0af91477b5ee';

  Future<List<dynamic>> fetchChartData() async {
    final response = await http.get(Uri.parse('$baseUrl?api-key=$apiKey&format=json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['records'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
