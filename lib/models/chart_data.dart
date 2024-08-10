class ChartData {
  final String cityName;
  final int doctorCount;

  ChartData({required this.cityName, required this.doctorCount});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      cityName: json['cityname'], // Field for the city name
      doctorCount: int.parse(json['doctorcount'].toString()), // Field for the number of doctors
    );
  }
}
