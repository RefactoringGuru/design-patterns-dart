import 'package:flutter/material.dart';

import '../../../../adapter/flutter_adapter/classic_app/repaint_event.dart';
import '../../../../observer/subscriber_flutter_widget/subscriber/subscriber_widget.dart';
import '../../application.dart';
import '../composite/named_panel.dart';

class SnapshotWidget extends StatelessWidget {
  final MementoEditorApplication app;

  const SnapshotWidget({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NamedPanel(
      name: 'MEMENTO',
      children: [
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
    );
  }
}
