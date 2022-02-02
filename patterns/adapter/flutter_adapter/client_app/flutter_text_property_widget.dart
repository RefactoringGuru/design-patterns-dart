import 'package:flutter/material.dart';

import '../../../observer/app_observer/observer/app_observer.dart';
import '../adapter/classic_app.dart';
import 'app.dart';

class FlutterTextPropertyWidget extends StatefulWidget {
  final App classicApp;

  const FlutterTextPropertyWidget({
    Key? key,
    required this.classicApp,
  }) : super(key: key);

  @override
  State<FlutterTextPropertyWidget> createState() =>
      _FlutterTextPropertyWidgetState();
}

class _FlutterTextPropertyWidgetState extends State<FlutterTextPropertyWidget> {
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

  late EventFunction<ClassicAppRepaint> _classicAppRepaintEvent;

  @override
  void initState() {
    _classicAppRepaintEvent = widget.classicApp.events.subscribe(
      (ClassicAppRepaint e) => setState(() {}),
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.classicApp.events.unsubscribe(_classicAppRepaintEvent);
    super.dispose();
  }

  Widget _buildTextSizeSlider(App app) {
    return Row(
      children: [
        SizedBox(
          width: 31,
          child: Text(app.textSize.toString().padLeft(3, ' ')),
        ),
        SizedBox(
          width: 200,
          child: Slider(
            value: app.textSize.toDouble(),
            max: app.maxTextSize.toDouble(),
            min: 1,
            onChanged: (newVal) {
              app.textSize = newVal.toInt();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTextColorButtons(App app) {
    final colors = [
      Colors.black,
      Colors.pink.shade600,
      Colors.deepPurple.shade600,
    ];
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
    final isColorSelect = (color == app.textColor);
    return GestureDetector(
      onTap: () {
        app.textColor = color;
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
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
