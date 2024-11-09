import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_grid/src/providers/game.dart';
import 'package:mind_grid/src/providers/setting.dart';
import 'package:mind_grid/src/widgets/grid.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    final gridWidth = settings.gridWidth;
    final gridHeight = settings.gridHeight;

    final game = ref.watch(
        gameNotifierProvider(gridWidth: gridWidth, gridHeight: gridHeight));

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
                  gridData: game.gridData,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/play/answer');
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
