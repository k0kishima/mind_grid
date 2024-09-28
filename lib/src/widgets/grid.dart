import 'package:flutter/material.dart';
import 'package:mind_grid/src/models/grid_color.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class Grid extends StatelessWidget {
  final List<List<GridColor>> gridData;
  final int rows;
  final int columns;

  const Grid({
    super.key,
    required this.gridData,
    required this.rows,
    required this.columns,
  });

  Color _getColor(GridColor gridColor) {
    switch (gridColor) {
      case GridColor.black:
        return Colors.black;
      case GridColor.yellow:
        return Colors.yellow;
      case GridColor.red:
        return Colors.red;
      case GridColor.green:
        return Colors.green;
      case GridColor.white:
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cellSize = (constraints.maxWidth / columns) - 2;

        return Column(
          children: List.generate(rows, (rowIndex) {
            return Row(
              children: List.generate(columns, (colIndex) {
                final color = _getColor(gridData[rowIndex][colIndex]);
                return Container(
                  width: cellSize,
                  height: cellSize,
                  color: color,
                  margin: const EdgeInsets.all(1.0),
                );
              }),
            );
          }),
        );
      },
    );
  }
}

@widgetbook.UseCase(
  name: 'Quiz',
  type: Grid,
)
Grid answerMode(BuildContext context) {
  final gridData = [
    [GridColor.white, GridColor.black, GridColor.white, GridColor.white],
    [GridColor.black, GridColor.black, GridColor.white, GridColor.black],
    [GridColor.white, GridColor.white, GridColor.black, GridColor.white],
    [GridColor.white, GridColor.black, GridColor.white, GridColor.white],
  ];
  return Grid(
    gridData: gridData,
    rows: 4,
    columns: 4,
  );
}

@widgetbook.UseCase(
  name: 'Result',
  type: Grid,
)
Grid resultMode(BuildContext context) {
  final gridData = [
    [GridColor.white, GridColor.green, GridColor.white, GridColor.white],
    [GridColor.green, GridColor.red, GridColor.white, GridColor.green],
    [GridColor.white, GridColor.white, GridColor.green, GridColor.white],
    [GridColor.white, GridColor.green, GridColor.white, GridColor.yellow],
  ];
  return Grid(
    gridData: gridData,
    rows: 4,
    columns: 4,
  );
}
