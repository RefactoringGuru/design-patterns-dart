# Chain of Responsibility pattern
Chain of Responsibility is a behavioral design pattern that lets you pass requests along a chain of handlers. 

## Server middleware example 
![image](https://user-images.githubusercontent.com/8049534/149480179-ba06640c-0858-4ff9-8957-f2c4aa22ccc4.png)

### Problem description:
https://refactoring.guru/design-patterns/chain-of-responsibility?#problem

### Origin source code:
This example rewrite from [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/chain_of_responsibility/example)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/149488654-7ff5f659-4086-4d1a-ae44-326c71fb880a.png)

### Client code:
```dart
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
```

**Output:**
```
Start middleware:
Sever: login User("admin@example.com", "admin_pass")
UserExistsMiddleware: user has been validated
RoleCheckMiddleware: role defined as "admin"
Authorization successful

Start middleware:
Sever: login User("user@example.com", "user_pass")
UserExistsMiddleware: user has been validated
RoleCheckMiddleware: role defined as "user"
Authorization successful

Start middleware:
Sever: login User("not exist user", "pass")
UserExistsMiddleware: this email(not exist user) is not registered!
User is not authorized

Start middleware:
Sever: login User("user@example.com", "fail password")
UserExistsMiddleware: wrong password!
User is not authorized

Start middleware:
Sever: login User("user@example.com", "user_pass")
ThrottlingMiddleware: Request limit exceeded! Requests=5, limit=4 per minute
User is not authorized
```
