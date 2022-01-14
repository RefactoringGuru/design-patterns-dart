library server;

part 'middleware.dart';

class Server {
  final Map<String, String> users;
  final Middleware middleware;

  Server({
    required this.users,
    required this.middleware,
  }) {
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

  bool hasEmail(String email) => users.containsKey(email);

  bool isValidPassword(String email, String password) {
    return users[email] == password;
  }
}
