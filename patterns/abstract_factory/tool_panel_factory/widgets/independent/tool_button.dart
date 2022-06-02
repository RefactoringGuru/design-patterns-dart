import 'package:flutter/material.dart';

import 'hove.dart';

class ToolButton extends StatelessWidget {
  final Function() onTap;
  final bool active;
  final Widget icon;

  const ToolButton({
    Key? key,
    required this.onTap,
    this.active = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hover(
        builder: (hoverForce) {
          return Container(
            width: 64,
            height: 64,
            color: color(hoverForce),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: icon,
            ),
          );
        },
      ),
    );
  }

  Color color(double hoverForce) => active
      ? Color.lerp(Colors.white10, Colors.white12, hoverForce)!
      : Color.lerp(Colors.transparent, Colors.white10, hoverForce)!;
}
