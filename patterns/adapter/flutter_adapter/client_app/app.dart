import 'dart:ui';

import 'package:flutter/material.dart';

import '../adapter/classic_app_base.dart';
import 'business_logic/color_rules.dart';
import 'business_logic/text_coloring.dart';

class App extends ClassicAppBase {
  App() {
    textColoring = TextColoring('Flutter Adapter', this);
  }

  late final TextColoring textColoring;
  final colorRules = ColorRules();

  @override
  void onWheel(double deltaX, double deltaY) {
    textColoring.size += deltaY ~/ 10;
  }

  @override
  void onMouseDown() {
    textColoring.color = colorRules.nextColor(textColoring.color);
  }

  @override
  void onPaint(Canvas canvas, Size size) {
    textColoring.paint(canvas, size);
  }
}
