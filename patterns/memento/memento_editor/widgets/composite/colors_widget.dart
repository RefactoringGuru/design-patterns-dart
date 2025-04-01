import 'package:flutter/material.dart';

class ColorsWidget extends StatelessWidget {
  final Color? currentColor;
  final List<Color> colors;
  final void Function(Color color) onColorSelect;

  const ColorsWidget({
    Key? key,
    required this.currentColor,
    required this.colors,
    required this.onColorSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: currentColor == null ? 0.2 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
        ),
        child: Row(
          children: colors.map(_buildColorButton).toList(),
        ),
      ),
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
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(2)),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
