import 'package:chart_app/screens/chart_screen.dart';
import 'package:chart_app/screens/home_screen.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/chart',
      builder: (context, state) => const ChartScreen(),
    ),
  ],
);
