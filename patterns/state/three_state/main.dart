import 'pattern/switcher.dart';
import 'states/one.dart';

void main() {
  final switcher = Switcher(
    initState: One(),
  );

  switcher.call(); // call(1): One
  switcher.call(); // call(2): Two
  switcher.call(); // call(3): Three
  switcher.call(); // call:(4) One
}
