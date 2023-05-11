import 'package:flutter/material.dart';

import '../../../abstract_factory/tool_panel_factory/widgets/independent/event_listenable_builder.dart';
import '../../../abstract_factory/tool_panel_factory/widgets/independent/panel.dart';
import '../pattern/manipulator.dart';

class CurrentState extends StatelessWidget {
  final Manipulator manipulator;

  const CurrentState({
    Key? key,
    required this.manipulator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 300,
      child: Panel(
        thicknessHeight: 64,
        direction: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: EventListenableBuilder(
              event: manipulator.onStateChange,
              builder: (context) {
                return EventListenableBuilder(
                  event: manipulator.onUpdate,
                  builder: (context) {
                    return Text(
                      manipulator.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
}
