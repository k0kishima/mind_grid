import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mind_grid/src/providers/game.dart';
import 'package:mind_grid/src/widgets/grid.dart';
import 'package:mind_grid/src/models/grid_color.dart';
import 'package:mind_grid/src/providers/setting.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    final gridWidth = settings.gridWidth;
    final gridHeight = settings.gridHeight;

    final game = ref.watch(
        gameNotifierProvider(gridWidth: gridWidth, gridHeight: gridHeight));

    final resultGrid = List.generate(
      game.gridData.length,
      (row) => List.generate(
        game.gridData[row].length,
        (col) {
          final correctAnswer = game.gridData[row][col];
          final userAnswer = game.userAnswers[row][col];

          if (correctAnswer == GridColor.black &&
              userAnswer == GridColor.black) {
            return GridColor.green;
          } else if (correctAnswer == GridColor.black &&
              userAnswer == GridColor.white) {
            return GridColor.red;
          } else if (correctAnswer == GridColor.white &&
              userAnswer == GridColor.black) {
            return GridColor.yellow;
          } else {
            return GridColor.white;
          }
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Grid(
            gridData: resultGrid,
          ),
        ),
      ),
    );
  }
}
