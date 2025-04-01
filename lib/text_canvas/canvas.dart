import 'dart:math';

import 'primitives.dart';

class Canvas {
  final int width;
  final int height;
  late List<List<List<int>>> _pixel;
  final int lineStretch;

  Canvas(
    this.width,
    this.height, {
    this.lineStretch = 3,
    Color? fillColor,
  }) {
    final realWidth = width * lineStretch;

    fillColor ??= Color.light;
    if (fillColor ==  Color.transparent) {
      fillColor = Color.white;
    }

    _pixel = [
      for (var i = 0; i < height; i++)
        List.from(
          List.filled(realWidth, fillColor.units),
        ),
    ];
  }

  var translate = Point(0, 0);
  var penColor = Color.black;

  void setPixel(int x, int y) {
    x += translate.x;
    y += translate.y;

    if (x < 0 || x > width - 1 || y < 0 || y > height - 1) {
      return;
    }

    if (penColor == Color.transparent) {
      return;
    }

    final realY = y;
    final realX = (x * lineStretch) ~/ 1;
    for (var i = 0; i < lineStretch; i++) {
      _pixel[realY][realX + i] = penColor.units;
    }
  }

  void char(int x, int y, Color char) {
    x += translate.x;
    y += translate.y;

    if (x < 0 || x > width * lineStretch - 1 || y < 0 || y > height - 1) {
      return;
    }

    if (char == Color.transparent) {
      return;
    }

    _pixel[y][x] = char.units;
  }

  var _currPos = Point(0, 0);

  void moveTo(int x, int y) => _currPos = Point(x, y);

  /// Bresenham's algorithm is taken from here
  /// https://gist.github.com/bert/1085538#file-plot_line-c
  void lineTo(final int x, final int y) {
    final x1 = _currPos.x, y1 = _currPos.y;

    var x0 = x, y0 = y;

    final dx = (x1 - x0).abs(),
        sx = x0 < x1 ? 1 : -1,
        dy = -(y1 - y0).abs(),
        sy = y0 < y1 ? 1 : -1;

    var err = dx + dy;
    late int e2;

    while (true) {
      setPixel(x0, y0);
      if (x0 == x1 && y0 == y1) break;
      e2 = 2 * err;
      if (e2 >= dy) {
        err += dy;
        x0 += sx;
      }
      if (e2 <= dx) {
        err += dx;
        y0 += sy;
      }
    }
    moveTo(x, y);
  }

  void rectangle(int width, int height) {
    final x = _currPos.x;
    final y = _currPos.y;
    lineTo(width + x, y);
    lineTo(width + x, height + y);
    lineTo(x, height + y);
    lineTo(x, y);
  }

  /// Bresenham's algorithm is taken from here
  /// https://gist.github.com/bert/1085538#file-plot_circle-c
  void circle(int radius) {
    final xm = _currPos.x;
    final ym = _currPos.y;
    int x = -radius, y = 0, err = 2 - 2 * radius;
    do {
      setPixel(xm - x, ym + y);
      setPixel(xm - y, ym - x);
      setPixel(xm + x, ym - y);
      setPixel(xm + y, ym + x);
      radius = err;
      if (radius > x) err += ++x * 2 + 1;
      if (radius <= y) err += ++y * 2 + 1;
    } while (x < 0);
  }

  void border(int width, int height, BorderStyle borderStyle) {
    if (borderStyle == BorderStyle.empty) {
      return;
    }

    assert(width >= 2);
    assert(height >= 2);

    char(0, 0, borderStyle.topLeft);
    char(width - 1, 0, borderStyle.topRight);
    char(width - 1, height - 1, borderStyle.bottomRight);
    char(0, height - 1, borderStyle.bottomLeft);

    for (var x = 1; x < width - 1; x++) {
      char(x, 0, borderStyle.top);
    }

    for (var y = 1; y < height - 1; y++) {
      char(width - 1, y, borderStyle.right);
    }

    for (var y = 1; y < height - 1; y++) {
      char(0, y, borderStyle.right);
    }

    for (var x = 1; x < width - 1; x++) {
      char(x, height - 1, borderStyle.bottom);
    }
  }

  void text(String text, {int widthCenter = -1, int heightCenter = -1}) {
    widthCenter = widthCenter < 0 ? text.length : widthCenter;
    heightCenter = heightCenter < 0 ? 1 : heightCenter;

    var x = (widthCenter - text.length) ~/ 2;
    var y = heightCenter ~/ 2;

    for (final c in text.split('')) {
      char(x++, y, Color(c));
    }
  }

  @override
  String toString() {
    return _pixel
        .map((e) => e
            .map(
              (e) => String.fromCharCodes(e),
            )
            .join(''))
        .join('\n');
  }
}
