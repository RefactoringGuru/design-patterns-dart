import 'pattern/singleton.dart';

void main() {
  // dart style
  Singleton().doSome();
  Singleton().doSome();

  // standard style
  Singleton.instance.doSome();
}
