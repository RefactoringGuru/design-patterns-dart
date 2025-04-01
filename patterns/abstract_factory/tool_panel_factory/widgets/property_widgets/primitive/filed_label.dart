import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  final Widget child;

  const FieldLabel({
    Key? key,
    required this.text,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Text('$text:'),
        SizedBox(width: 10),
        child,
        SizedBox(width: 20),
      ],
    );
  }
}
