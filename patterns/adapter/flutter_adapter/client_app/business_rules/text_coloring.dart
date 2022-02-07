import 'dart:ui';

import '../../classic_app/repaint_compatible.dart';

class TextColoring {
  final RepaintCompatible _repaintContext;

  TextColoring(this._repaintContext);

  final maxTextSize = 400;

  var _size = 50;

  int get size => _size;

  set size(int newVal) {
    if (newVal == _size) {
      return;
    }

    if (newVal > maxTextSize) {
      _size = maxTextSize;
    } else if (newVal < 1) {
      _size = 1;
    } else {
      _size = newVal;
    }

    _repaintContext.repaint();
  }

  var _color = Color(0xffd81b60);

  Color get color => _color;

  set color(Color newColor) {
    if (_color == newColor) {
      return;
    }

    _color = newColor;
    _repaintContext.repaint();
  }
}
