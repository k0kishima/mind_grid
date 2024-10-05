import 'package:mind_grid/src/models/grid_color.dart';

class Game {
  final List<List<GridColor>> gridData;
  final List<List<GridColor>> userAnswers;
  final bool isAnswerSubmitted;

  Game({
    required this.gridData,
    required this.userAnswers,
    this.isAnswerSubmitted = false,
  });

  Game copyWith({
    List<List<GridColor>>? gridData,
    List<List<GridColor>>? userAnswers,
    bool? isAnswerSubmitted,
  }) {
    return Game(
      gridData: gridData ?? this.gridData,
      userAnswers: userAnswers ?? this.userAnswers,
      isAnswerSubmitted: isAnswerSubmitted ?? this.isAnswerSubmitted,
    );
  }
}
