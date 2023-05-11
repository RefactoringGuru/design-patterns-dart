import '../server/server.dart';

class UserExistsMiddleware extends Middleware {
  UserExistsMiddleware({Middleware? next}) : super(next: next);

  @override
  bool check(String email, String password) {
    if (server == null) {
      return false;
    }

    if (!server!.hasEmail(email)) {
      print('UserExistsMiddleware: this email($email) is not registered!');
      return false;
    }

    if (!server!.isValidPassword(email, password)) {
      print('UserExistsMiddleware: wrong password!');
      return false;
    }

    print('UserExistsMiddleware: user has been validated');

    return checkNext(email, password);
  }
}
