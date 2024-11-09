import 'package:flutter/material.dart';
import 'package:mind_grid/src/models/grid_color.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class Grid extends StatelessWidget {
  final List<List<GridColor>> gridData;
  final void Function(int row, int col)? onTap;

  const Grid({
    super.key,
    required this.gridData,
    this.onTap,
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
    final rows = gridData.length;
    final columns = rows > 0 ? gridData[0].length : 0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxCellWidth = (constraints.maxWidth / columns) - 2;
        final double maxCellHeight = (constraints.maxHeight / rows) - 2;
        final double cellSize =
            maxCellWidth < maxCellHeight ? maxCellWidth : maxCellHeight;

        return Column(
          children: List.generate(rows, (rowIndex) {
            return Row(
              children: List.generate(columns, (colIndex) {
                final color = _getColor(gridData[rowIndex][colIndex]);
                return GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(rowIndex, colIndex);
                    }
                  },
                  child: Container(
                    width: cellSize,
                    height: cellSize,
                    color: color,
                    margin: const EdgeInsets.all(1.0),
                  ),
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
  );
}
