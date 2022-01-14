library server;

part 'middleware.dart';

class Server {
  final Map<String, String> _users;
  final Middleware middleware;

  Server({
    required Map<String, String> users,
    required this.middleware,
  }) : _users = Map.of(users) {
    _applyServerToAllMiddleware();
  }

  bool logIn(String email, String password) {
    print('Sever: login User("$email", "$password")');
    return middleware.check(email, password);
  }

  void _applyServerToAllMiddleware() {
    Middleware? middleware = this.middleware;
    while (middleware != null) {
      middleware._server = this;
      middleware = middleware.next;
    }
  }

  bool hasEmail(String email) => _users.containsKey(email);

  bool isValidPassword(String email, String password) {
    return _users[email] == password;
  }
}
