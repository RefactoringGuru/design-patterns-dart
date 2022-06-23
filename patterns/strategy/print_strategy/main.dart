import 'dart:io';
import 'dart:typed_data';

void main() {
  final byteList = SomeData()
    ..add('Hello guru')
    ..add(123456789)
    ..add(3.1456564984);

  final strFormat = byteList.toStringView(StrViewStrategy());
  final hexFormat = byteList.toStringView(HexViewStrategy());
  final zipFormat = byteList.toStringView(ZipViewStrategy());

  print(strFormat);
  print(hexFormat);
  print(zipFormat);
}

abstract class ViewStrategy {
  String out(SomeData byteList);
}

class HexViewStrategy implements ViewStrategy {
  @override
  String out(SomeData byteList) {
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

class StrViewStrategy implements ViewStrategy {
  @override
  String out(SomeData byteList) {
    return '${byteList.toList().join(', ')}\n';
  }
}

class ZipViewStrategy extends StrViewStrategy {
  @override
  String out(SomeData byteList) {
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

class SomeData {
  String toStringView(ViewStrategy strategy) {
    return '${strategy.runtimeType}:\n'
        '${strategy.out(this)}';
  }

  void add(dynamic str) {
    _buf.add(str);
  }

  List toList() => _buf;

  final _buf = <dynamic>[];
}
