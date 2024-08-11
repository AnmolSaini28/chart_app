class ChartData {
  final String refineryName;
  final double crudeOilProcessed;

  ChartData({required this.refineryName, required this.crudeOilProcessed});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      refineryName: json['oil_companies_'] ?? 'Unknown', // Adjust the field name based on the API response
      crudeOilProcessed: double.tryParse(json['quantity_000_metric_tonnes_'].toString()) ?? 0.0, // Adjust the field name based on the API response
    );
  }
}
