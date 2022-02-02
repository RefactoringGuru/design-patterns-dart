import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import '../../../observer/app_observer/observer/app_observer.dart';
import '../adapter/classic_app.dart';
import 'app.dart';

class TextPropertyWidget extends StatefulWidget {
  final App classicApp;

  const TextPropertyWidget({
    Key? key,
    required this.classicApp,
  }) : super(key: key);

  @override
  State<TextPropertyWidget> createState() =>
      _TextPropertyWidgetState();
}

class _TextPropertyWidgetState extends State<TextPropertyWidget> {
  @override
  Widget build(BuildContext context) {
    final app = widget.classicApp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextSizeSlider(app),
        _buildTextColorButtons(app),
      ],
    );
  }

  final colors = [
    material.Colors.black,
    material.Colors.pink.shade600,
    material.Colors.deepPurple.shade600,
    material.Colors.blue.shade600,
    material.Colors.green.shade600,
  ];

  late EventFunction<ClassicAppRepaint> _classicAppRepaintEvent;
  late EventFunction<NextTextColorEvent> _nextColorEvent;

  @override
  void initState() {
    _classicAppRepaintEvent = widget.classicApp.events.subscribe(
      (ClassicAppRepaint e) => setState(() {}),
    );

    _nextColorEvent = widget.classicApp.events.subscribe(
      (NextTextColorEvent e) => setState(() {
        final currColor = widget.classicApp.textColoring.color;
        var nextIndex = colors.indexOf(currColor) + 1;

        if (nextIndex >= colors.length) {
          nextIndex = 0;
        }

        widget.classicApp.textColoring.color = colors[nextIndex];
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.classicApp.events
      ..unsubscribe(_classicAppRepaintEvent)
      ..unsubscribe(_nextColorEvent);
    super.dispose();
  }

  Widget _buildTextSizeSlider(App app) {
    return Row(
      children: [
        SizedBox(
          width: 31,
          child: Text(
            app.textColoring.size.toString(),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          width: 200,
          child: material.Slider(
            value: app.textColoring.size.toDouble(),
            max: app.textColoring.maxTextSize.toDouble(),
            min: 1,
            onChanged: (newVal) {
              app.textColoring.size = newVal.toInt();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTextColorButtons(App app) {
    return Row(
      children: [
        ...colors.map(
          (Color color) {
            return _buildColorButton(color, app);
          },
        ).toList(),
      ],
    );
  }

  Widget _buildColorButton(Color color, App app) {
    final isColorSelect = (color == app.textColoring.color);
    return GestureDetector(
      onTap: () {
        app.textColoring.color = color;
      },
      child: Container(
        width: 20,
        height: 20,
        color: color,
        child: isColorSelect ? _buildSelectColorIcon() : null,
      ),
    );
  }

  Widget _buildSelectColorIcon() {
    return Center(
      child: Container(
        width: 4,
        height: 4,
        color: material.Colors.white.withOpacity(0.8),
      ),
    );
  }
}
