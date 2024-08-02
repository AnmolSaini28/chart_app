import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: const Text('Home Screen', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            shadowColor: Colors.black,
            elevation: 20,
            fixedSize: const Size(300, 40),
          ),
          onPressed: () {
            context.go('/chart');
          },
          child: const Text('View Chart', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
        ),
      ),
    );
  }
}
