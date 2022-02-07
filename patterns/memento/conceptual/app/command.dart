import 'editor.dart';
import 'snapshot.dart';

/// EN: A command object can act as a caretaker. In that case, the
/// command gets a memento just before it changes the
/// originator's state. When undo is requested, it restores the
/// originator's state from a memento.
///
/// RU: Опекуном может выступать класс команд (см. паттерн Команда).
/// В этом случае команда сохраняет снимок состояния объекта-
/// получателя, перед тем как передать ему своё действие. А в
/// случае отмены команда вернёт объект в прежнее состояние.
class Command {
  Snapshot _backup;

  Command._(this._backup);

  factory Command.makeBackup(Editor editor) {
    return Command._(editor.createSnapshot());
  }

  void undo() {
    _backup.restore();
  }
}
