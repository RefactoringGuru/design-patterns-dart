import '../pattern/context.dart';
import '../pattern/expression.dart';

abstract class Operation implements Expression {
  final Expression expression1;
  final Expression expression2;

  Operation(this.expression1, this.expression2);

  bool operation(bool a, bool b);

  @override
  bool evaluate(Context context) {
    final a = expression1.evaluate(context);
    final b = expression2.evaluate(context);
    return operation(a, b);
  }

  @override
  String toDebugString(Context context) {
    final a = expression1.toDebugString(context);
    final b = expression2.toDebugString(context);
    return '$b $runtimeType $a';
  }
}
