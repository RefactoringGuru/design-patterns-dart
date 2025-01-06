import 'package:flutter/material.dart';

class ThemeProperty extends StatelessWidget {
  final Widget child;

  const ThemeProperty({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Arial',
      ),
      child: Theme(
        data: ThemeData(
          primarySwatch: Colors.pink,
          unselectedWidgetColor: Colors.grey, // Your color
        ),
        child: child,
      ),
    );
  }
}
