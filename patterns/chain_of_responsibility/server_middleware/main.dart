import 'middleware/role_check_middleware.dart';
import 'middleware/throttling_middleware.dart';
import 'middleware/user_exists_middleware.dart';
import 'server/server.dart';

void main() {
  final server = Server(
    users: {
      'admin@example.com': 'admin_pass',
      'user@example.com': 'user_pass',
    },
    // EN: All checks are linked. Client can build various chains using the
    // same components.
    //
    // RU: Проверки связаны в одну цепь. Клиент может строить различные
    // цепи, используя одни и те же компоненты.
    middleware: ThrottlingMiddleware(
      requestPerMinute: 4,
      next: UserExistsMiddleware(
        next: RoleCheckMiddleware(),
      ),
    ),
  );

  for (var value in [
    ['admin@example.com', 'admin_pass'],
    ['user@example.com', 'user_pass'],
    ['not exist user', 'pass'],
    ['user@example.com', 'fail password'],
    ['user@example.com', 'user_pass'], // limited request
  ]) {
    userLogin(server, email: value[0], password: value[1]);
  }
}

void userLogin(
  Server server, {
  required String email,
  required String password,
}) {
  print('Start middleware:');
  final success = server.logIn(email, password);

  if (success) {
    print('Authorization successful');
  } else {
    print('User is not authorized');
  }

  print('');
}
