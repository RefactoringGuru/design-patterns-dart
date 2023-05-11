import 'package:flutter/material.dart';

import 'panel.dart';

class ToolBar extends StatelessWidget {
  final String title;
  final Widget child;

  const ToolBar({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      direction: Axis.vertical,
      child: Column(
        children: [
          _buildTitle(title),
          child,
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      height: 20,
      color: Colors.white10,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontFamily: 'Arial',
          decoration: TextDecoration.none,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
