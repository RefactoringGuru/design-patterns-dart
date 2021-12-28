import 'dart:typed_data';

import 'graph_element.dart';

class Star extends GraphElement {
  final int size;

  Star({required this.size}) {
    final list = <int>[];
    final p1 = (size * .1).toInt(),
        p3 = (size * .3).toInt(),
        p4 = (size * .4).toInt(),
        p7 = (size * .7).toInt(),
        p8 = (size * .8).toInt(),
        p9 = (size * .9).toInt();
    list.addAll([p1, p9]);
    list.addAll([p4, 0]);
    list.addAll([p7, p9]);
    list.addAll([0, p3]);
    list.addAll([p8, p3]);
    list.addAll([p1, p9]);
    points = Int32List.fromList(list);
  }

  @override
  late Int32List points;
}
