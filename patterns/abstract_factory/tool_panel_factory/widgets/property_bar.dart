import 'package:flutter/material.dart';

import 'independent/panel.dart';

class PropertyBar extends StatelessWidget {
  const PropertyBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 200,
      child: Panel(
        direction: Axis.horizontal,
        child: Row(
          children: [
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
