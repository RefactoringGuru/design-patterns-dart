abstract class Singleton {
  factory Singleton() {
    if (_instance == null) {
      print('Create singleton once.');
      _instance = ConcreteSingleton();
    }

    return _instance!;
  }

  static Singleton get instance => Singleton();

  void doSome();

  static Singleton? _instance;
}

class ConcreteSingleton implements Singleton {
  @override
  void doSome() {
    print('doSome()');
  }
}
