import 'package:collection/collection.dart';

class Color {
  final List<int> units;

  Color(String symbol)
      : assert(symbol.length == 1),
        units = symbol.codeUnits;

  static final Color black = Color('█');
  static final Color dark = Color('▓');
  static final Color grey = Color('▒');
  static final Color light = Color('░');
  static final Color white = Color(' ');
  static final Color point = Color('■');
  static final Color transparent = Color('`');

  @override
  bool operator ==(Object other) {
    return other is Color && ListEquality().equals(other.units, units);
  }

  @override
  int get hashCode => ListEquality().hash(units);

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
    '`  `'
    '````',
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
