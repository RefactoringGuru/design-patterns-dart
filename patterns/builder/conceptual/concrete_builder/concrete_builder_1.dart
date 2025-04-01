import '../pattern/builder.dart';
import '../pattern/product.dart';
import '../product/concrete_product_1.dart';

class ConcreteBuilder1 implements Builder {
  @override
  void buildPart1() {
    _product.addLine('one');
  }

  @override
  void buildPart2() {
    _product.addLine('two');
  }

  @override
  void buildPart3() {
    _product.addLine('three');
  }

  @override
  Product get result => _product;

  final _product = ConcreteProduct1('ConcreteBuilder1');
}
