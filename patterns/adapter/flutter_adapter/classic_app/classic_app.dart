import 'dart:ui';

import '../../../observer/app_observer/observer/app_observer.dart';
import 'classic_app_events.dart';
import 'repaint_compatible.dart';

  void onMoseEnter();

  void onMouseLeave();

  void onKeyDown();

  void onKeyUp();

  void onWheel(double deltaX, double deltaY);

  void onPaint(Canvas canvas, Size size);

  void repaint();
}
