import '../pattern/element.dart';
import '../pattern/visitor.dart';

class Three implements Element {
  final String param3 = '3';

  @override
  void accept(Visitor visitor) {
    visitor.visitThree(this);
  }
}
