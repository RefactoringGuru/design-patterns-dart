import 'dart:ui';

import '../../../observer/app_observer/observer/app_observer.dart';
import '../../../observer/app_observer/observer/event.dart';

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

class ClassicAppRepaint extends Event {}

abstract class ClassicAppBase implements ClassicApp {
  final _appEvents = AppObserver();

  @override
  AppObserver get events => _appEvents;

  @override
  void onKeyDown() {}

  @override
  void onKeyUp() {}

  @override
  void onMoseEnter() {}

  @override
  void onMouseDown() {}

  @override
  void onMouseLeave() {}

  @override
  void onMouseMove() {}

  @override
  void onMouseUp() {}

  @override
  void onWheel(double deltaX, double deltaY) {}

  @override
  void onPaint(Canvas canvas, Size size);

  @override
  void repaint() {
    _appEvents.notify(ClassicAppRepaint());
  }
}
