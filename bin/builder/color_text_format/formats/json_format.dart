import 'dart:convert';
import 'text_format.dart';

class JsonFormat extends TextFormat {
  final _list = <Map<String, String>>[];

  void add(Map<String, String> item) {
    _list.add(item);
  }

  @override
  String get content => JsonEncoder.withIndent('  ').convert(_list);
}
