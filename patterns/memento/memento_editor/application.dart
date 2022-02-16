import 'editor/editor.dart';
import 'memento_pattern/snapshot.dart';

class MementoEditorApplication {
  final editor = Editor();
  final snapshots = <Snapshot>[];
}
