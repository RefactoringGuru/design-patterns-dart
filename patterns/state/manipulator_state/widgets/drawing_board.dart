import 'package:flutter/material.dart';

import '../app/app.dart';

class DrawingBoard extends StatelessWidget {
  final App app;

  const DrawingBoard({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: CustomPaint(
        painter: _Painter(app),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final App app;

  _Painter(this.app);

  @override
  void paint(Canvas canvas, Size size) {
    for(final shape in app.shapes) {
      shape.paint(canvas);
    }

    app.manipulator.paint(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


