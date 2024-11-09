import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_grid/src/providers/game.dart';
import 'package:mind_grid/src/providers/setting.dart';
import 'package:mind_grid/src/widgets/grid.dart';
import 'package:mind_grid/src/models/grid_color.dart';

class AnswerScreen extends HookConsumerWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    final gridWidth = settings.gridWidth;
    final gridHeight = settings.gridHeight;

    final gameNotifier = ref.read(
        gameNotifierProvider(gridWidth: gridWidth, gridHeight: gridHeight)
            .notifier);
    final game = ref.watch(
        gameNotifierProvider(gridWidth: gridWidth, gridHeight: gridHeight));

    final userAnswers = useState<List<List<GridColor>>>(
      List.generate(
        gridHeight,
        (row) => List.generate(gridWidth, (col) => game.userAnswers[row][col]),
      ),
    );

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
                  gridData: userAnswers.value,
                  onTap: (row, col) {
                    // Toggle the color locally in userAnswers
                    final currentColor = userAnswers.value[row][col];
                    final newColor = currentColor == GridColor.white
                        ? GridColor.black
                        : GridColor.white;

                    userAnswers.value = [
                      for (int r = 0; r < gridHeight; r++)
                        [
                          for (int c = 0; c < gridWidth; c++)
                            if (r == row && c == col)
                              newColor
                            else
                              userAnswers.value[r][c]
                        ]
                    ];
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
          for (int row = 0; row < gridHeight; row++) {
            for (int col = 0; col < gridWidth; col++) {
              gameNotifier.updateUserAnswer(
                  row, col, userAnswers.value[row][col]);
            }
          }
          gameNotifier.submitAnswers();
          context.go('/play/result');
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
