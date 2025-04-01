import 'subject.dart';

class RealSubject implements Subject {
  @override
  String request() {
    return 'Real data.';
  }
}
