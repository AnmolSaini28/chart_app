class ChartData {
  final String category;
  final int value;

  ChartData({required this.category, required this.value});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      category: json['category'],
      value: int.parse(json['value']),
    );
  }
}
