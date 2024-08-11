import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation when the screen is displayed
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffB66FFF),
        foregroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: const Text(
          'Chart App Home',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Column(
                    children: [
                      const SizedBox(height: 20,),
                      FadeTransition(
                        opacity: _opacityAnimation,
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                        ),
                      ),
                      Divider(height: 2, color: Colors.grey.shade500,),
                      const SizedBox(height: 160),
                      SlideTransition(
                        position: _slideAnimation,
                        child: const Text(
                          'Type Below to explore data',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Divider(height: 2, color: Colors.black87),
                    ],
                  );
                },
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffB66FFF),
                  foregroundColor: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 10,
                  fixedSize: const Size(300, 40),
                ),
                onPressed: () {
                  context.go('/chart');
                },
                child: const Text(
                  'View Chart',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
