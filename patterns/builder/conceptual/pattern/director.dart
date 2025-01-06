import 'builder.dart';
import 'product.dart';

class Director {
  Product construct(Builder builder) {
    builder.buildPart1();
    builder.buildPart2();
    builder.buildPart3();

    return builder.result;
  }
}
