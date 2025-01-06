import 'dart:io';

import '../utils/analysis.dart';
import '../utils/formatted_table.dart';
import '../utils/raw_data.dart';

abstract class DataMiner {
  final String fileName;

  DataMiner(this.fileName);

  void mine() {
    final file = openFile();
    final raw = extractData(file);
    final table = parseData(raw);
    final analysis = analyzeData(table);
    sendReport(analysis, table);
  }

  File openFile() {
    final file = File(reportPath + fileName);

    if (!file.existsSync()) {
      throw 'File not exists.';
    }

    return file;
  }

  RawData extractData(File file) {
    return file.readAsStringSync();
  }

  StringTable parseData(RawData raw);

  Analysis analyzeData(StringTable table) {
    return Analysis(table);
  }

  void sendReport(Analysis analysis, StringTable table) {
    final formattedTable = FormattedTable();

    formattedTable
      ..addRow('Name', 'Index')
      ..addLine();

    for (final row in table) {
      final name = row[0];
      final index = double.parse(row[1]);

      formattedTable.addRow(name, index);
    }

    formattedTable
      ..addLine()
      ..addRow('sum:', analysis.sum)
      ..addRow('len:', analysis.len);

    print(formattedTable.toString());
  }

  String get reportPath => '${Platform.script.pathSegments.sublist(
            0,
            Platform.script.pathSegments.length - 1,
          ).join(
            Platform.pathSeparator,
          )}'
      '${Platform.pathSeparator}'
      'reports'
      '${Platform.pathSeparator}';
}
