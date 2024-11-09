import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_grid/src/providers/game.dart';
import 'package:mind_grid/src/providers/setting.dart';
import 'package:mind_grid/src/widgets/grid.dart';
import 'package:mind_grid/src/models/grid_color.dart';

class AnswerScreen extends ConsumerWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    final gridWidth = settings.gridWidth;
    final gridHeight = settings.gridHeight;

    final gameNotifier = ref.read(gameNotifierProvider(gridWidth: gridWidth, gridHeight: gridHeight).notifier);
    final game = ref.watch(gameNotifierProvider(gridWidth: gridWidth, gridHeight: gridHeight));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer Input'),
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
                  gridData: game.userAnswers,
                  onTap: (row, col) {
                    final currentColor = game.userAnswers[row][col];
                    final newColor = currentColor == GridColor.white
                        ? GridColor.black
                        : GridColor.white;

                    gameNotifier.updateUserAnswer(row, col, newColor);
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gameNotifier.submitAnswers();
          context.go('/play/result');
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
