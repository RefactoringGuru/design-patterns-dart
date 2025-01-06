import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Function(double hoverForce) builder;

  const Hover({Key? key, required this.builder}) : super(key: key);

  @override
  _HoverState createState() => _HoverState();
}

class _HoverState extends State<Hover> with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    _animation = AnimationController(
      duration: Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    )..addListener(
        () {
          setState(() {});
        },
      );
    super.initState();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _animation.forward(from: _animation.value);
      },
      onExit: (_) {
        _animation.reverse();
      },
      child: widget.builder(_animation.value),
    );
  }
}
