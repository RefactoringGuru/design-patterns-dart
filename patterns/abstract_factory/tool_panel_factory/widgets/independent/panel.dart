import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  static const thicknessWidth = 64.0;
  final double thicknessHeight;

  final Axis direction;
  final Widget child;

  const Panel({
    Key? key,
    required this.direction,
    required this.child,
    this.thicknessHeight = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: direction == Axis.horizontal ? thicknessHeight : null,
      width: direction == Axis.vertical ? thicknessWidth : null,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF3B3B3B),
        borderRadius: BorderRadius.all(Radius.circular(3)),
        boxShadow: [
          BoxShadow(
            color: Color(0x7C000000),
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
