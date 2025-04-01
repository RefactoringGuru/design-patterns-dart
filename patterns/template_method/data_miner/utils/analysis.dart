import 'raw_data.dart';

class Analysis {
  Analysis(StringTable table) {
    _analyze(table);
  }

  void _analyze(StringTable table) {
    int len = 0;
    double sum = 0.0;

    for (final row in table) {
      final index = double.parse(row[1]);
      sum += index;
      len++;
    }

    this.len = len;
    this.sum = sum;
  }

  late final int len;
  late final double sum;
}
