void main() {
  final editor = Editor('New Document');
  final firstState = Command.makeBackup(editor);
  editor.text += ' add text';
  final secondState = Command.makeBackup(editor);

  print('Current state: "${editor.text}"');

  firstState.undo();
  print('First state: "${editor.text}"');

  secondState.undo();
  print('Second state: "${editor.text}"');
}

/// EN: The originator holds some important data that may change over
/// time. It also defines a method for saving its state inside a
/// memento and another method for restoring the state from it.
///
/// RU: Класс создателя должен иметь специальный метод, который.
/// сохраняет состояние создателя в новом объекте-снимке.
class Editor {
  var text = '';
  var curX = 0;
  var curY = 0;
  var selectionWidth = 0;

  Editor(this.text);

  /// EN: Saves the current state inside a memento.
  Snapshot createSnapshot() {
    /// EN: Memento is an immutable object; that's why the
    /// originator passes its state to the memento's
    /// constructor parameters.
    ///
    /// RU: Снимок — неизменяемый объект, поэтому Создатель
    /// передаёт все своё состояние через параметры
    /// конструктора.
    return Snapshot(this, text, curX, curY, selectionWidth);
  }
}

/// EN: The memento class stores the past state of the editor.
///
/// RU: Снимок хранит прошлое состояние редактора.
class Snapshot {
  final Editor _editor;
  final String _text;
  final int _curX;
  final int _curY;
  final int _selectionWidth;

  Snapshot(
    this._editor,
    this._text,
    this._curX,
    this._curY,
    this._selectionWidth,
  );

  /// EN: At some point, a previous state of the editor can be
  /// restored using a memento object.
  ///
  /// RU: В нужный момент владелец снимка может восстановить
  /// состояние редактора.
  void restore() {
    _editor
      ..text = _text
      ..curX = _curX
      ..curY = _curY
      ..selectionWidth = _selectionWidth;
  }
}

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
