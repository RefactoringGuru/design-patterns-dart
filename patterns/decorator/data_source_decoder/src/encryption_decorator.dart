import 'dart:convert';

import 'data_source.dart';
import 'data_source_decorator.dart';

class EncryptionDecorator extends DataSourceDecorator {
  EncryptionDecorator(DataSource source) : super(source);

  @override
  void writeData(String data) {
    super.writeData(_encode(data));
  }

  @override
  String readData() {
    return _decode(super.readData());
  }

  String _encode(String data) {
    final encrypt = data.codeUnits.map((e) => e + 1).toList();
    return base64.encode(encrypt);
  }

  String _decode(String data) {
    final encrypt = base64.decode(data);
    final decrypt = encrypt.map((e) => e - 1).toList();
    return String.fromCharCodes(decrypt);
  }
}
