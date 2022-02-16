import 'package:flutter/material.dart';

import '../../application.dart';
import '../composite/named_panel.dart';
import '../composite/snapshot_list_widget.dart';

class MementoWidget extends StatelessWidget {
  final MementoEditorApplication app;

  const MementoWidget({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NamedPanel(
      name: 'MEMENTO',
      children: [
        ..._buildDescription(Theme.of(context).textTheme.bodyMedium!),
        SizedBox(height: 20),
        _buildSaveStateButton(),
        SizedBox(height: 5),
        Expanded(
          child: SnapshotListWidget(
            snapshots: app.snapshots,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDescription(TextStyle style) {
    return [
      Text(
        '1. Select the shape.',
        style: style,
      ),
      SizedBox(height: 5),
      Text(
        '2. Change color, size or position.',
        style: style,
      ),
      SizedBox(height: 5),
      Text(
        '3. Click the "save state" button.',
        style: style,
      ),
      SizedBox(height: 5),
      Text(
        'Now you can restore states by selecting them from the list.',
        style: style,
      ),
    ];
  }

  Widget _buildSaveStateButton() {
    return Row(
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
    );
  }
}
