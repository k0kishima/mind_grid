import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_grid/src/models/grid_color.dart';
import 'package:mind_grid/src/providers/setting.dart';
import 'package:mind_grid/src/widgets/grid.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    final gridWidth = settings.gridWidth;
    final gridHeight = settings.gridHeight;

    final random = Random();
    final gridData = List.generate(
      gridHeight,
      (row) => List.generate(
        gridWidth,
        (col) => random.nextBool() ? GridColor.white : GridColor.black,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Screen'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double cellSize = (constraints.maxWidth / gridWidth) - 2;
          final totalHeight = cellSize * gridHeight;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: totalHeight,
                ),
                child: Grid(
                  gridData: gridData,
                  rows: gridHeight,
                  columns: gridWidth,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
