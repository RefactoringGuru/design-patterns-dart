class Color {
  final int code;

  Color(String symbol)
      : assert(symbol.length == 1),
        code = symbol.codeUnitAt(0);

  static final Color black = Color('█');
  static final Color dark = Color('▓');
  static final Color grey = Color('▒');
  static final Color light = Color('░');
  static final Color white = Color(' ');
  static final Color point = Color('■');
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);
}
