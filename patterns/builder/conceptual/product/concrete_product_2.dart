import '../pattern/product.dart';

class ConcreteProduct2 implements Product {
  ConcreteProduct2(String name) {
    _buff.add(name);
  }

  void addLine(String name) {
    final num = ['1️⃣', '2️⃣', '3️⃣'][_buff.length - 1];
    _buff.add('$num: $name');
  }

  @override
  String toString() {
    return '${_buff.join('\n')}\n';
  }

  final _buff = <String>[];
}
