import 'context.dart';

abstract class Expression {
  bool evaluate(Context context);

  String toDebugString(Context context);
}
