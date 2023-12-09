import 'package:assignment3/Calc.dart';
import 'package:assignment3/Home.dart';
import 'package:assignment3/Todo.dart';
import 'package:assignment3/Weather.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'calculator',
          builder: (BuildContext context, GoRouterState state) {
            return const CalcScreen();
          },
        ),
        GoRoute(
          path: 'todo',
          builder: (BuildContext context, GoRouterState state) {
            return const TodoScreen();
          },
        ),
        GoRoute(
          path: 'weather',
          builder: (BuildContext context, GoRouterState state) {
            return const WeatherScreen();
          },
        ),
      ],
    ),
  ],
);

// The main app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
