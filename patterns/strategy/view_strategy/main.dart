import 'pattern/byte_context.dart';
import 'strategies/hex_view_strategy.dart';
import 'strategies/str_view_strategy.dart';
import 'strategies/zip_view_strategy.dart';

void main() {
  final byteList = ByteContext()
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
