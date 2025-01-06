import 'dart:convert';
import 'dart:io';

import 'data_source.dart';
import 'data_source_decorator.dart';

class CompressionDecorator extends DataSourceDecorator {
  var compressionLevel = 6;

  CompressionDecorator(DataSource source) : super(source);

  @override
  void writeData(String data) {
    super.writeData(_compress(data));
  }

  @override
  String readData() {
    return _decompress(super.readData());
  }

  String _compress(String stringData) {
    final gzip = GZipCodec(level: compressionLevel);
    final encodeStr = base64.encode(
      gzip.encode(stringData.codeUnits),
    );
    return encodeStr;
  }

  String _decompress(String stringData) {
    final gzip = GZipCodec(level: compressionLevel);
    final decodeStr = gzip.decode(
      base64.decode(stringData),
    );
    return String.fromCharCodes(decodeStr);
  }
}
