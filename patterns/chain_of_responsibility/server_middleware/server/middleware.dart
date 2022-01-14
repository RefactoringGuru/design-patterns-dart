part of server;

abstract class Middleware {
  final Middleware? next;

  Middleware({
    this.next,
  });

  bool check(String email, String password);

  bool checkNext(String email, String password) {
    return next?.check(email, password) ?? true;
  }

  Server? _server;

  Server? get server => _server;
}
