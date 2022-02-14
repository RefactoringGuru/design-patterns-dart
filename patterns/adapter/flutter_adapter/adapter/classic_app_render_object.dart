import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

import '../classic_app/classic_app.dart';
import '../classic_app/repaint_event.dart';

class ClassicAppRenderObject extends RenderBox {
  ClassicAppRenderObject(ClassicApp classicApp) {
    _classicApp = classicApp;
    _classicApp.events.subscribe(_clientAppRepaint);
    _isSubscribe = true;
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void performLayout() {
    size = Size(
      constraints.maxWidth == double.infinity ? 0 : constraints.maxWidth,
      constraints.maxHeight == double.infinity ? 0 : constraints.maxHeight,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.translate(offset.dx, offset.dy);
    context.canvas.clipRect(offset & size);
    _classicApp.onPaint(context.canvas, size);
  }

  @override
  void dispose() {
    if (_isSubscribe) {
      _classicApp.events.unsubscribe(_clientAppRepaint);
      _isSubscribe = false;
    }
    super.dispose();
  }

  late ClassicApp _classicApp;
  var _isSubscribe = false;

  ClassicApp get classicApp => _classicApp;

  set classicApp(ClassicApp newClassicApp) {
    if (newClassicApp == _classicApp) {
      return;
    }

    if (_isSubscribe) {
      _classicApp.events.unsubscribe(_clientAppRepaint);
      _isSubscribe = false;
    }

    _classicApp = newClassicApp;
    _classicApp.events.subscribe(_clientAppRepaint);
    _isSubscribe = true;
  }

  void _clientAppRepaint(RepaintEvent e) => markNeedsPaint();

  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    if (event is PointerHoverEvent || event is PointerMoveEvent) {
      _classicApp.onMouseMove(event.position.dx, event.position.dy);
    } else if (event is PointerScrollEvent) {
      _classicApp.onPointerWheel(event.scrollDelta.dx, event.scrollDelta.dy);
    } else if (event is PointerDownEvent) {
      if (event.buttons == kPrimaryMouseButton) {
        _classicApp.onMouseDown(event.position.dx, event.position.dy);
      } else if (event.buttons == kSecondaryMouseButton) {
      } else if (event.buttons == kMiddleMouseButton) {}
    } else if (event is PointerUpEvent) {
      _classicApp.onMouseUp();
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (size.contains(position)) {
      result.add(BoxHitTestEntry(this, position));
      return true;
    }
    return false;
  }
}
