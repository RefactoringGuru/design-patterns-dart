import 'package:flutter/material.dart';

class ColorButtonsWidget extends StatelessWidget {
  final Color currentColor;
  final List<Color> colors;
  final void Function(Color color) onColorSelect;

  const ColorButtonsWidget({
    Key? key,
    required this.currentColor,
    required this.colors,
    required this.onColorSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map(_buildColorButton).toList(),
    );
  }

  Widget _buildColorButton(Color color) {
    final isColorSelect = (color == currentColor);
    return GestureDetector(
      onTap: () {
        onColorSelect(color);
      },
      child: Container(
        width: 20,
        height: 20,
        color: color,
        child: isColorSelect ? _buildSelectColorIcon() : null,
      ),
    );
  }

  Widget _buildSelectColorIcon() {
    return Center(
      child: Container(
        width: 4,
        height: 4,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
