import 'dart:convert';

import '../color_text_reader.dart';

class JsonFormat extends TextFormat {
  final _list = <Map<String, String>>[];

  void add(Map<String, String> item) {
    _list.add(item);
  }

  @override
  String get content => JsonEncoder.withIndent('  ').convert(_list);
}
