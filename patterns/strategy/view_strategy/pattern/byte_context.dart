import 'view_strategy.dart';

class ByteContext {
  String toStringView(ViewStrategy strategy) {
    return '${strategy.runtimeType}:\n'
        '${strategy.out(this)}';
  }

  void add(dynamic value) {
    _buf.add(value);
  }

  List toList() => _buf;

  final _buf = <dynamic>[];
}
