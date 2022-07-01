import '../pattern/builder.dart';
import '../pattern/product.dart';
import '../product/concrete_product_2.dart';

class ConcreteBuilder2 implements Builder {
  @override
  void buildPart1() {
    _product.addLine('first');
  }

  @override
  void buildPart2() {
    _product.addLine('second');
  }

  @override
  void buildPart3() {
    _product.addLine('third');
  }

  @override
  Product get result => _product;

  final _product = ConcreteProduct2('ConcreteBuilder2');
}
