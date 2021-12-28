import 'dart:math';
import 'dart:typed_data';

import 'graph_element.dart';

class Wave extends GraphElement {
  Wave({
    required final int height,
    final int length = 50,
    final double waveStep = .8,
  }) {
    final list = <int>[];
    for (var x = 0; x < length; x++) {
      final y = (height + cos(x / pi / waveStep) * height).toInt();
      list.addAll([x, y]);
    }
    points = Int32List.fromList(list);
  }

  @override
  late Int32List points;
}
