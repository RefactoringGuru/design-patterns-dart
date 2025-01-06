import 'package:flutter/material.dart';

import '../../../abstract_factory/tool_panel_factory/widgets/independent/event_listenable_builder.dart';
import '../app/app.dart';

class DrawingBoard extends StatefulWidget {
  final App app;

  const DrawingBoard({Key? key, required this.app}) : super(key: key);

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  late FocusNode focusNode;
  late Offset _lastMouseDown;

  @override
  void initState() {
    focusNode = FocusNode(skipTraversal: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      autofocus: true,
      focusNode: focusNode,
      onKeyEvent: widget.app.manipulator.keyDown,
      child: GestureDetector(
        onDoubleTap: () => widget.app.manipulator.mouseDoubleClick(
          _lastMouseDown.dx,
          _lastMouseDown.dy,
        ),
        child: Listener(
          onPointerDown: (e) {
            _lastMouseDown = e.localPosition;
            FocusScope.of(context).requestFocus(focusNode);
            widget.app.manipulator.mouseDown(
              e.localPosition.dx,
              e.localPosition.dy,
            );
          },
          onPointerHover: (e) => widget.app.manipulator.mouseMove(
            e.localPosition.dx,
            e.localPosition.dy,
          ),
          onPointerMove: (e) => widget.app.manipulator.mouseMove(
            e.localPosition.dx,
            e.localPosition.dy,
          ),
          onPointerUp: (e) => widget.app.manipulator.mouseUp(),
          child: Container(
            constraints: BoxConstraints.expand(),
            color: Color(0xff1f1f1f),
            child: EventListenableBuilder(
              event: widget.app.shapes.onChange,
              builder: (_) {
                return EventListenableBuilder(
                  event: widget.app.manipulator.onUpdate,
                  builder: (_) {
                    return MouseRegion(
                      cursor: widget.app.manipulator.cursor,
                      child: CustomPaint(
                        painter: _Painter(widget.app),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}

class _Painter extends CustomPainter {
  final App app;

  _Painter(this.app);

  @override
  void paint(Canvas canvas, Size size) {
    for (final shape in app.shapes) {
      shape.paint(canvas);
    }

    app.manipulator.paint(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
