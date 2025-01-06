import '../pattern/element.dart';
import '../pattern/visitor.dart';

class One implements Element {
  final String param1 = '1';

  @override
  void accept(Visitor visitor) {
    visitor.visitOne(this);
  }
}
