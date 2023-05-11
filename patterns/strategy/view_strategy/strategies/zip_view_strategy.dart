import 'dart:io';

import '../pattern/byte_context.dart';
import 'str_view_strategy.dart';

class ZipViewStrategy extends StrViewStrategy {
  @override
  String out(ByteContext byteList) {
    final codes = super.out(byteList).codeUnits;
    final bytes = GZipCodec().encode(codes);
    final buf = StringBuffer();

    var odd = 1;
    for (final byte in bytes) {
      final hexByte = byte.toRadixString(16).padLeft(2, '0');
      buf.write('$hexByte ');

      if (odd++ % 16 == 0) {
        buf.writeln();
      }
    }

    return buf.toString();
  }
}
