import 'package:chart_app/models/chart_data.dart';
import 'package:chart_app/services/api_service.dart';
import 'package:chart_app/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChartScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffB66FFF),
        foregroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        leading: IconButton(onPressed: (){context.go('/');}, icon: const Icon(Icons.arrow_back)),
        title: const Text('City-wise Doctor Count', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
      ),
      body: FutureBuilder<List<ChartData>>(
        future: apiService.fetchChartData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ChartWidget(data: snapshot.data!);
          }
        },
      ),
    );
  }
}
