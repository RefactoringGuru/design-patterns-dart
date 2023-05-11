import '../server/server.dart';

/// EN: ConcreteHandler. Checks whether there are too many failed login requests.
///
/// RU: Конкретный элемент цепи обрабатывает запрос по-своему.
class ThrottlingMiddleware extends Middleware {
  final int requestPerMinute;
  var _request = 0;
  var _startTime = DateTime.now();

  ThrottlingMiddleware({
    required this.requestPerMinute,
    Middleware? next,
  }) : super(next: next);

  /// EN: Please, not that checkNext() call can be inserted both in the
  /// beginning of this method and in the end.
  ///
  /// This gives much more flexibility than a simple loop over all middleware
  /// objects. For instance, an element of a chain can change the order of
  /// checks by running its check after all other checks.
  ///
  /// RU: Обратите внимание, вызов checkNext() можно вставить как в начале
  /// этого метода, так и в середине или в конце.
  ///
  /// Это даёт еще один уровень гибкости по сравнению с проверками в цикле.
  /// Например, элемент цепи может пропустить все остальные проверки вперёд и
  /// запустить свою проверку в конце.
  @override
  bool check(String email, String password) {
    const waiting = Duration(minutes: 2);
    final hasExpired = DateTime.now().isAfter(_startTime.add(waiting));

    if (hasExpired) {
      _request = 0;
      _startTime = DateTime.now();
    }

    _request++;

    if (_request > requestPerMinute) {
      print('ThrottlingMiddleware: Request limit exceeded! '
          'Requests=$_request, limit=$requestPerMinute per minute');
      return false;
    }

    return checkNext(email, password);
  }
}
