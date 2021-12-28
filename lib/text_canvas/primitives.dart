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
  static final Color transparent = Color(' ');

  @override
  bool operator ==(Object other) {
    return other is Color && ListEquality().equals(other.units, units);
  }

  @override
  int get hashCode => ListEquality().hash(units);

  @override
  String toString() {
    final symbol = String.fromCharCodes(units);
    return '$runtimeType(symbol: "$symbol", unit: $units)';
  }
}

class BorderStyle {
  static final BorderStyle bold = BorderStyle.fromBorderText(
    '▄▄▄▄'
    '█  █'
    '▀▀█▀',
  );

  static final BorderStyle double = BorderStyle.fromBorderText(
    '╔══╗'
    '║  ║'
    '╚═╦╝',
  );

  static final BorderStyle single = BorderStyle.fromBorderText(
    '┌──┐'
    '│  │'
    '└─┬┘',
  );

  static final BorderStyle round = BorderStyle.fromBorderText(
    '╭━━╮'
    '    '
    '    ',
  );

  static final BorderStyle empty = BorderStyle.fromBorderText(
    '    '
    '    '
    '    ',
  );
  final Color topLeft;
  final Color topRight;
  final Color bottomRight;
  final Color bottomLeft;

  final Color top;
  final Color bottom;

  final Color left;
  final Color right;

  final Color bottomConnect;

  const BorderStyle._(
    this.topLeft,
    this.topRight,
    this.bottomRight,
    this.bottomLeft,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.bottomConnect,
  );

  factory BorderStyle.fromBorderText(String text) {
    return BorderStyle._(
      Color(text[0]),
      Color(text[3]),
      Color(text[11]),
      Color(text[8]),
      Color(text[1]),
      Color(text[9]),
      Color(text[4]),
      Color(text[7]),
      Color(text[10]),
    );
  }
}
