import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../abstract_factory/tool_panel_factory/widgets/independent/event_listenable_builder.dart';
import '../../../abstract_factory/tool_panel_factory/widgets/independent/panel.dart';
import '../../../abstract_factory/tool_panel_factory/widgets/independent/tool_button.dart';
import '../app/app.dart';

class ToolBar extends StatelessWidget {
  final App app;

  const ToolBar({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 12,
      child: Panel(
        thicknessHeight: 64,
        direction: Axis.horizontal,
        child: EventListenableBuilder(
            event: app.manipulator.onStateChange,
            builder: (_) {
              return Row(
                children: [
                  for (final tool in app.tools)
                    ToolButton(
                      active: tool.state == app.manipulator.state,
                      icon: Center(child: tool.icon),
                      onTap: () {
                        app.manipulator.changeState(tool.state);
                      },
                    )
                ],
              );
            }),
      ),
    );
  }
}
