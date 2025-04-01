import '../pattern/byte_context.dart';
import '../pattern/view_strategy.dart';

class StrViewStrategy implements ViewStrategy {
  @override
  String out(ByteContext byteList) {
    return '${byteList.toList().join(', ')}\n';
  }
}
