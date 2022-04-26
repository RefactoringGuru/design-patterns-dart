import 'memento.dart';
import 'snapshot.dart';

class Caretaker {
  final _mementoList = <Memento>[];

  List<Memento> get list => List<Memento>.unmodifiable(_mementoList);

  void addMemento(Memento memento) {
    _mementoList.add(memento);
  }

  bool isSnapshotExists(Snapshot snapshot) {
    return list.any(
      (e) => e.snapshot == snapshot,
    );
  }
}
