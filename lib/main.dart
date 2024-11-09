import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_grid/src/view/home/home_screen.dart';
import 'package:mind_grid/src/view/play/question_screen.dart';
import 'package:mind_grid/src/view/play/answer_screen.dart';
import 'package:mind_grid/src/view/play/result_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'play/question',
          builder: (context, state) => const QuestionScreen(),
        ),
        GoRoute(
          path: 'play/answer',
          builder: (context, state) => const AnswerScreen(),
        ),
        GoRoute(
          path: 'play/result',
          builder: (context, state) => const ResultScreen(),
        ),
      ],
    ),
  ],
);
