import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_grid/src/models/game.dart';
import 'package:mind_grid/src/models/grid_color.dart';
import 'dart:math';

class GameNotifier extends StateNotifier<Game> {
  GameNotifier(int gridWidth, int gridHeight)
      : super(Game(
          gridData: _generateRandomGrid(gridWidth, gridHeight),
          userAnswers: List.generate(gridHeight,
              (_) => List.generate(gridWidth, (_) => GridColor.white)),
        ));

  static List<List<GridColor>> _generateRandomGrid(int width, int height) {
    final random = Random();
    return List.generate(
      height,
      (row) => List.generate(
        width,
        (col) => random.nextBool() ? GridColor.white : GridColor.black,
      ),
    );
  }

  void updateUserAnswer(int row, int col, GridColor color) {
    final updatedUserAnswers = List<List<GridColor>>.from(state.userAnswers);
    updatedUserAnswers[row][col] = color;

    state = state.copyWith(userAnswers: updatedUserAnswers);
  }

  void submitAnswers() {
    state = state.copyWith(isAnswerSubmitted: true);
  }
}

final gameProvider =
    StateNotifierProvider.family<GameNotifier, Game, Map<String, int>>(
        (ref, gridSize) {
  final gridWidth = gridSize['width'] ?? 8;
  final gridHeight = gridSize['height'] ?? 8;
  return GameNotifier(gridWidth, gridHeight);
});
