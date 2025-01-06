import 'package:flutter/material.dart';

import '../app/tools.dart';
import 'independent/tool_bar.dart';
import 'independent/tool_button.dart';

class ColorsToolBar extends StatelessWidget {
  final Tools tools;

  const ColorsToolBar({Key? key, required this.tools}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolBar(
      title: 'colors',
      child: ValueListenableBuilder(
        valueListenable: tools.activeColor,
        builder: (_, activeColor, __) {
          return Column(
            children: [
              for (final color in tools.colors)
                ToolButton(
                  icon: Icon(Icons.circle, color: color),
                  active: color == activeColor,
                  onTap: () {
                    tools.activeColor.value = color;
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
