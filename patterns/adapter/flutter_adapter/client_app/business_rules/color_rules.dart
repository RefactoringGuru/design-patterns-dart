import 'dart:ui';

class ColorRules {
  final colors = [
    Color(0xFF000000),
    Color(0xFFD81B60),
    Color(0xFF5E35B1),
    Color(0xFF1E88E5),
    Color(0xFF43A047),
  ];

  Color nextColor(Color currentColor) {
    var nextIndex = colors.indexOf(currentColor) + 1;

    if (nextIndex >= colors.length || nextIndex < 0) {
      nextIndex = 0;
    }

    return colors[nextIndex];
  }
}
