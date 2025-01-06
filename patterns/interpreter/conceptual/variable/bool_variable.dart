import '../pattern/context.dart';
import '../pattern/expression.dart';

class BoolVariable implements Expression {
  BoolVariable(this.name);

  final String name;

  @override
  bool evaluate(Context context) {
    return context.lookup(name);
  }

  @override
  String toDebugString(Context context) {
    final value = context.lookup(name);
    return '$name($value)';
  }
}
