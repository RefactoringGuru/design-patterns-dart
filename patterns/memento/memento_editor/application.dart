import 'dart:math';

import 'editor/create_memento_event.dart';
import 'editor/editor.dart';
import 'memento_pattern/caretaker.dart';
import 'memento_pattern/memento.dart';
import 'shapes/shape.dart';

class MementoEditorApplication {
  final editor = Editor();
  final caretaker = Caretaker();

  MementoEditorApplication() {
    createDefaultShapes();
  }

  void createDefaultShapes() {
    const radius = 300.0;
    for (var i = 0; i < 7; i++) {
      final x = 60 + radius + cos(i / 1.15) * radius;
      final y = 60 + radius + sin(i / 1.15) * radius;
      editor.shapes.add(Shape(x, y));
    }
  }

  void saveState() {
    final snapshot = editor.backup();

    if (caretaker.isSnapshotExists(snapshot)) {
      return;
    }

    final memento = Memento(DateTime.now(), snapshot);
    caretaker.addMemento(memento);
    editor.events.notify(CreateMementoEvent());
  }

  void restoreState(Memento memento) {
    editor
      ..restore(memento.snapshot)
      ..repaint();
  }
}
