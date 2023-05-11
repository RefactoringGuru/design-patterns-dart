import 'snapshot.dart';

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
