import 'product.dart';

abstract class Builder {
  void buildPart1();
  void buildPart2();
  void buildPart3();

  Product get result;
}
