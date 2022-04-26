import 'package:flutter/material.dart';

import '../../memento_pattern/memento.dart';

class SnapshotListWidget extends StatelessWidget {
  final List<Memento> mementoList;
  final void Function(Memento) onMementoRestore;

  const SnapshotListWidget({
    Key? key,
    required this.mementoList,
    required this.onMementoRestore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Material(
        type: MaterialType.transparency,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: mementoList.map((e) => _buildItem('Snapshot', e)).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(String name, Memento memento) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      color: Colors.black.withOpacity(0.02),
      child: ListTile(
        leading: Container(
          color: Colors.grey.shade200,
          width: 50,
          height: double.infinity,
          child: Icon(Icons.backup),
        ),
        title: Text(name ),
        subtitle: SingleChildScrollView(
          child: Text(memento.time.toIso8601String()),
          scrollDirection: Axis.horizontal,
        ),
        onTap: () {
          onMementoRestore(memento);
        },
      ),
    );
  }
}
