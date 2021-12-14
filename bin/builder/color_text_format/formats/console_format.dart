import 'text_format.dart';

class ConsoleFormat extends TextFormat {
  final _buff = <String>[' '];

  static const colors = {
    'red': '\x1b[31m',
    'green': '\x1b[32m',
    'blue': '\x1b[34m',
  };

  var _fgColor = '';
  var _end = '';

  set color(String colorName) {
    _fgColor = colors[colorName] ?? '';
    _end = _fgColor == '' ? '' : '\x1B[0m';
  }

  void write(String text) => _buff.add('$_fgColor$text$_end');

  @override
  String get content => _buff.join(' ');
}
