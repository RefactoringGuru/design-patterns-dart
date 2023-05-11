import 'dart:typed_data';

import '../pattern/byte_context.dart';
import '../pattern/view_strategy.dart';

class HexViewStrategy implements ViewStrategy {
  @override
  String out(ByteContext byteList) {
    final buf = StringBuffer();

    for (final val in byteList.toList()) {
      buf.write('${val.toString().padRight(15)}: ');

      if (val is String) {
        buf.writeln(_stringToHex(val));
      } else {
        buf.writeln(_valueToHex(val, size: 8));
      }
    }

    return buf.toString();
  }

  String _stringToHex(String value) {
    return value.codeUnits
        .map((charCode) => _valueToHex(size: 1, charCode))
        .join(' ');
  }

  String _valueToHex<T>(T value, {required int size}) {
    late ByteData byteData;

    if (size == 1) {
      byteData = ByteData(1)..setInt8(0, value as int);
    } else {
      byteData = ByteData(size);
      if (value is double) {
        byteData.setFloat64(0, value);
      } else if (value is int) {
        byteData.setInt64(0, value);
      }
    }

    final bytes = byteData.buffer.asUint8List();
    return bytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join(' ');
  }
}
