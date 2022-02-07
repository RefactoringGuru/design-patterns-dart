import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final int current;
  final int max;
  final void Function(int newSize) onChange;

  const SliderWidget({
    Key? key,
    required this.current,
    required this.max,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 31,
          child: Text(
            '$current',
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          width: 200,
          child: Slider(
            value: current.toDouble(),
            max: max.toDouble(),
            min: 1,
            onChanged: (newVal) {
              onChange(newVal.toInt());
            },
          ),
        ),
      ],
    );
  }
}
