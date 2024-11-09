import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mind_grid/src/models/game.dart';
import 'package:mind_grid/src/models/grid_color.dart';
import 'dart:math';

part 'game.g.dart';

@riverpod
class GameNotifier extends _$GameNotifier {
  @override
  Game build({int gridWidth = 8, int gridHeight = 8}) {
    return Game(
      gridData: _generateRandomGrid(gridWidth, gridHeight),
      userAnswers: List.generate(
          gridHeight, (_) => List.generate(gridWidth, (_) => GridColor.white)),
    );
  }

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
