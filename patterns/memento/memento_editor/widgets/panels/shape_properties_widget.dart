import 'package:flutter/material.dart';

import '../../../../adapter/flutter_adapter/classic_app/repaint_event.dart';
import '../../../../observer/subscriber_flutter_widget/subscriber/subscriber_widget.dart';
import '../../application.dart';
import '../composite/colors_widget.dart';
import '../composite/named_panel.dart';

class ShapePropertiesWidget extends StatelessWidget {
  final MementoEditorApplication app;
  final List<Color> colors;

  const ShapePropertiesWidget({
    Key? key,
    required this.app,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubscriberWidget<RepaintEvent>(
      observer: app.editor.events,
      builder: (buildContext, event) {
        return NamedPanel(
          name: 'SHAPE PROPERTIES',
          children: [
            Row(
              children: [
                _buildNumberField('x:', app.editor.activeShape?.shape.x),
                SizedBox(width: 20),
                _buildNumberField('y:', app.editor.activeShape?.shape.y),
              ],
            ),
            SizedBox(height: 20),
            _buildNumberField(
              'size:',
              app.editor.activeShape?.shape.size,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'color:',
                  style: TextStyle(
                    color: Colors.black.withOpacity(
                      app.editor.activeShape == null ? 0.5 : 1.0,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ColorsWidget(
                  currentColor: app.editor.activeShape?.shape.color,
                  colors: colors,
                  onColorSelect: (newColor) {
                    app.editor.activeShape?.changeColor(newColor);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildNumberField(String name, double? value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.black.withOpacity(value == null ? 0.5 : 1.0),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 60,
          child: TextField(
            enabled: value != null,
            controller: TextEditingController(
              text: value == null ? '' : value.toStringAsFixed(0),
            ),
            decoration: InputDecoration(
              filled: value != null,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
