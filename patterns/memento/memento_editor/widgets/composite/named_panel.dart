import 'package:flutter/material.dart';

class NamedPanel extends StatelessWidget {
  final String name;
  final List<Widget> children;

  NamedPanel({
    Key? key,
    required this.name,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        ...children,
      ],
    );
  }
}
