import 'miners/csv_miner.dart';
import 'miners/zip_miner.dart';
import 'miners/html_analyzer.dart';

void main() {
  print('HTMLMiner');
  HTMLMiner('google_workers.html').mine();

  print('CsvMiner');
  CsvMiner('twitter_workers.csv').mine();

  print('GuruMiner');
  ZipMiner('refactoring_guru_workers.zip').mine();
}

