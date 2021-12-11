import 'dart:typed_data';

import 'primitives.dart';

class Canvas {
  final int width;
  final int height;
  late List<Int16List> _pixel;
  final int lineStretch;

  Canvas(
    this.width,
    this.height, [
    this.lineStretch = 3,
  ]) {
    final realWidth = width * lineStretch;
    _pixel = [
      for (var i = 0; i < height; i++)
        Int16List.fromList(
          List.filled(realWidth, Color.light.code),
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

    final realY = y;
    final realX = (x * lineStretch) ~/ 1;
    for (var i = 0; i < lineStretch; i++) {
      _pixel[realY][realX + i] = penColor.code;
    }
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

  @override
  String toString() {
    return _pixel
        .map((e) => e
            .map(
              (e) => String.fromCharCode(e),
            )
            .join(''))
        .join('\n');
  }
}
