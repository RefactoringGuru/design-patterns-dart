import 'dart:io';

import '../pattern/data_miner.dart';
import '../utils/raw_data.dart';

class ZipMiner extends DataMiner {
  ZipMiner(super.fileName);

  @override
  RawData extractData(File file) {
    final content = File('${reportPath}refactoring_guru_workers.zip')
        .readAsBytesSync()
        .toList();
    final unzip = GZipCodec().decode(content);
    return String.fromCharCodes(unzip);
  }

  @override
  StringTable parseData(RawData raw) {
    final lines = raw.split('\n');
    final divIndex = lines.length ~/ 2;
    final names = lines.sublist(0, divIndex);
    final indexes = lines.sublist(divIndex);

    return [
      for (var i = 0; i < divIndex; i++)
        [
          names[i].trim(),
          indexes[i].trim(),
        ]
    ];
  }
}
