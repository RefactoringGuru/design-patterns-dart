import '../commands/command.dart';

class CommandHistory {
  final _stack = <Command>[];

  bool get isNotEmpty => _stack.isNotEmpty;

  void push(Command command) => _stack.add(command);

  Command pop() => _stack.removeLast();
}
