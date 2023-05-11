import 'elements/elements.dart';

void main() {
  final list = createElements();

  list.forEach(operation1);
  list.forEach(operation2);
}

Iterable<Object> createElements() {
  return [
    One(),
    Two(),
    Three(),
  ];
}

void operation1(Object obj) {
  if (obj is One) {
    print('operation1: one (param1 = ${obj.param1})');
  } else if (obj is Two) {
    print('operation1: two (param2 = ${obj.param2})');
  } else if (obj is Three) {
    print('operation1: two (param3 = ${obj.param3})');
  }
}

void operation2(Object obj) {
  if (obj is One) {
    print('operation2: one (param1 = ${obj.param1})');
  } else if (obj is Two) {
    print('operation2: two (param2 = ${obj.param2})');
  } else if (obj is Three) {
    print('operation2: two (param3 = ${obj.param3})');
  }
}
