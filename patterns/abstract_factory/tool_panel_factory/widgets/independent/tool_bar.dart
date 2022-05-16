import 'package:flutter/material.dart';

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
    return _buildNamedPanel(
      title: title,
      child: child,
    );
  }

  Widget _buildNamedPanel({required String title, required Widget child}) {
    return Container(
      width: 64,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Color(0xFF3B3B3B),
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: Color(0x7C000000),
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ]),
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
