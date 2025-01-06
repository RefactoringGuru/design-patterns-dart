import 'subject.dart';
import 'real_subject.dart';

class Proxy implements Subject {
  @override
  String request() {
    if (isSubjectLoaded) {
      return _subject!.request();
    }

    _load();
    return 'Proxy data.';
  }

  bool get isSubjectLoaded => _subject != null;

  void _load() async {
    Future.delayed(Duration(seconds: 1), () {
      _subject = RealSubject();
    });
  }

  Subject? _subject;
}
