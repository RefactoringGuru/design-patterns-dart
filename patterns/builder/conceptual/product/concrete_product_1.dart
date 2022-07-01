import '../pattern/product.dart';

class ConcreteProduct1 implements Product {
  ConcreteProduct1(String name) {
    _buff.add(name);
  }

  void addLine(String name) {
    final index = _buff.length.toString().padLeft(3, '0');
    _buff.add('$index: $name');
  }

  @override
  String toString() {
    return '${_buff.join('\n')}\n';
  }

  final _buff = <String>[];
}
