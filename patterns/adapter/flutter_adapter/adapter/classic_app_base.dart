import 'dart:ui';

import '../../../observer/app_observer/observer/app_observer.dart';
import 'classic_app.dart';
import 'classic_app_events.dart';

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
