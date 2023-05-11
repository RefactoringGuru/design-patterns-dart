import '../server/server.dart';

class RoleCheckMiddleware extends Middleware {
  RoleCheckMiddleware({Middleware? next}) : super(next: next);

  @override
  bool check(String email, String password) {
    if (email == 'admin@example.com') {
      print('RoleCheckMiddleware: role defined as "admin"');
      return true;
    }

    print('RoleCheckMiddleware: role defined as "user"');
    return checkNext(email, password);
  }
}
