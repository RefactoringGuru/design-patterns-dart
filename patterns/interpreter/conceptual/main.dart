import 'operations/and.dart';
import 'operations/or.dart';
import 'operations/xor.dart';
import 'pattern/context.dart';
import 'variable/variable.dart';

void main() {
  final context = Context();
  final variable1 = BoolVariable('var1');
  final variable2 = BoolVariable('var2');
  final variable3 = BoolVariable('var3');
  final variable4 = BoolVariable('var4');

  context.assign(variable1, true);
  context.assign(variable2, false);
  context.assign(variable3, true);
  context.assign(variable4, false);

  final expression = And(
    variable1, // false
    Xor(
      variable2, // false
      Or(
        variable3, // true
        variable4, // false
      ),
    ),
  );

  print(expression.evaluate(context));
  print(expression.toDebugString(context));
}
