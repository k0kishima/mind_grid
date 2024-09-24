import 'package:flutter/material.dart';
import 'package:mind_grid/src/models/grid_color.dart';

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
