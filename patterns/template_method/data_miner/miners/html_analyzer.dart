import '../pattern/data_miner.dart';
import '../utils/raw_data.dart';

class HTMLMiner extends DataMiner {
  HTMLMiner(super.fileName);

  @override
  StringTable parseData(RawData raw) {
    String regexString = r'<td class="s0"[^>]+>(.+)<\/td>'
        r'\s+'
        r'<td class="s1"[^>]+>(.+)<\/td>';
    final regExp = RegExp(regexString);
    final matches = regExp.allMatches(raw);

    return [
      for (final employer in matches)
        [
          employer.group(1)!,
          employer.group(2)!,
        ]
    ];
  }
}
