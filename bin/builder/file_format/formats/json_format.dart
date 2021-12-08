import 'dart:convert';

import '../color_text_reader.dart';

class JsonFormat extends TextFormat {
  @override
  String get content => jsonEncode([
        {
          'text': 'some text',
        },
        {
          'text': 'some text',
          'color': 'red',
        }
      ],);
}
