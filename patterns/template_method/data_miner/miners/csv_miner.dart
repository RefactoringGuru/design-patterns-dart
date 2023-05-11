import '../pattern/data_miner.dart';
import '../utils/raw_data.dart';

class CsvMiner extends DataMiner {
  CsvMiner(super.fileName);

  @override
  StringTable parseData(RawData raw) {
    return raw.split('\n').map((line) => line.split(',')).toList();
  }
}
