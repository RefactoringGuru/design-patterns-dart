import 'package:flutter/material.dart';

import '../../../../observer/subscriber_flutter_widget/subscriber/subscriber_widget.dart';
import '../../classic_app/repaint_event.dart';
import '../app.dart';
import 'color_buttons_widget.dart';
import 'slider_widget.dart';

class TextPropertyWidget extends StatelessWidget {
  final App classicApp;

  const TextPropertyWidget({
    Key? key,
    required this.classicApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = classicApp;
    return SubscriberWidget<RepaintEvent>(
      observer: app.events,
      builder: (context, event) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderWidget(
              current: app.textColoring.size,
              max: app.textColoring.maxTextSize,
              onChange: (newVal) {
                app.textColoring.size = newVal;
              },
            ),
            ColorButtonsWidget(
              currentColor: app.textColoring.color,
              colors: app.colorRules.colors,
              onColorSelect: (color) {
                app.textColoring.color = color;
              },
            ),
          ],
        );
      },
    );
  }
}
