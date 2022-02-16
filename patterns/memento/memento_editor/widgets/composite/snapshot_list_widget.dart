import 'package:flutter/material.dart';

class SnapshotListWidget extends StatelessWidget {
  final List snapshots;

  const SnapshotListWidget({Key? key, required this.snapshots})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Material(
        type: MaterialType.transparency,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: snapshots.map((e) => _buildItem('Snapshot', e)).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(String name, String hash) {
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
        title: Text(name),
        subtitle: SingleChildScrollView(
          child: Text(hash),
          scrollDirection: Axis.horizontal,
        ),
        onTap: () {},
      ),
    );
  }
}
