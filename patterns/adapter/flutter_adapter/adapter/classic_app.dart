import 'dart:ui';

import '../../../observer/app_observer/observer/app_observer.dart';

abstract class ClassicApp {
  AppObserver get events;

  void onMouseDown();

  void onMouseUp();

  void onMouseMove();

  void onMoseEnter();

  void onMouseLeave();

  void onKeyDown();

  void onKeyUp();

  void onWheel(double deltaX, double deltaY);

  void onPaint(Canvas canvas, Size size);

  void repaint();
}
