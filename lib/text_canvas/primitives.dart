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

class BorderStyle {
  static final BorderStyle bold = BorderStyle.fromBorderText(
    '▄▄▄▄'
    '█  █'
    '▀▀▀▀',
  );

  static final BorderStyle double = BorderStyle.fromBorderText(
    '╔══╗'
    '║  ║'
    '╚══╝',
  );

  static final BorderStyle single = BorderStyle.fromBorderText(
    '┌──┐'
    '│  │'
    '└──┘',
  );

  static final BorderStyle round = BorderStyle.fromBorderText(
    '╭━━╮'
    '    '
    '    ',
  );

  final String topLeft;
  final String topRight;
  final String bottomRight;
  final String bottomLeft;

  final String top;
  final String bottom;

  final String left;
  final String right;

  BorderStyle._(
    this.topLeft,
    this.topRight,
    this.bottomRight,
    this.bottomLeft,
    this.top,
    this.bottom,
    this.left,
    this.right,
  );

  factory BorderStyle.fromBorderText(String text) {
    return BorderStyle._(
      text[0],
      text[3],
      text[11],
      text[8],
      text[1],
      text[9],
      text[4],
      text[7],
    );
  }
}
