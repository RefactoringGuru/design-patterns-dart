import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  static const thickness = 64.0;

  final Axis direction;
  final Widget child;

  const Panel({
    Key? key,
    required this.direction,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: direction == Axis.horizontal ? thickness : null,
      width: direction == Axis.vertical ? thickness : null,
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
