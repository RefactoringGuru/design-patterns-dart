import 'package:flutter/material.dart';

import '../../../adapter/flutter_adapter/classic_app/repaint_event.dart';
import '../../../observer/subscriber_flutter_widget/subscriber/subscriber_widget.dart';
import '../application.dart';
import 'colors_widget.dart';

class RightPanelWidget extends StatelessWidget {
  final MementoEditorApplication app;

  RightPanelWidget({Key? key, required this.app}) : super(key: key);

  final colors = [
    Color(0xFF000000),
    Color(0xFFD81B60),
    Color(0xFF5E35B1),
    Color(0xFF1E88E5),
    Color(0xFF43A047),
    Color(0xFFFFFFFF),
  ];

  static const rowHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: SubscriberWidget<RepaintEvent>(
                observer: app.editor.events,
                builder: (buildContext, event) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SHAPE PROPERTIES',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          _buildNumberField('x:', app.editor.selectedShape?.x),
                          SizedBox(width: 20),
                          _buildNumberField('y:', app.editor.selectedShape?.y),
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildNumberField(
                        'size:',
                        app.editor.selectedShape?.size,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          children: [
                            Text(
                              'color:',
                              style: TextStyle(
                                color: Colors.black.withOpacity(
                                  app.editor.selectedShape == null ? 0.5 : 1.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ColorsWidget(
                              currentColor: app.editor.selectedShape?.color,
                              colors: colors,
                              onColorSelect: (newColor) {
                                app.editor.selectedShape?.color = newColor;
                                app.editor.repaint();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MEMENTO',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1. Select the shape.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '2. Change color, size or position.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '3. Click the "save state" button.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Now you can restore states by selecting them from the list.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        child: Text('Save state'),
                        onPressed: () {
                          app.snapshots.add(app.editor.backup());
                          app.editor.repaint();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: ColoredBox(
                      color: Colors.white,
                      child: Material(
                        type: MaterialType.transparency,
                        child: SubscriberWidget<RepaintEvent>(
                          observer: app.editor.events,
                          builder: (_, __) => ListView(
                            padding: EdgeInsets.all(5),
                            children: [
                              ...app.snapshots.map(
                                (e) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    color: Colors.black.withOpacity(0.02),
                                    child: ListTile(
                                      leading: Container(
                                        color: Colors.green,
                                        width: 50,
                                        height: double.infinity,
                                        child: Icon(Icons.animation),
                                      ),
                                      title: Text('Snapshot'),
                                      subtitle: SingleChildScrollView(
                                        child: Text(e),
                                        scrollDirection: Axis.horizontal,
                                      ),
                                      onTap: () {},
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
