import 'editor/editor.dart';
import 'memento_pattern/originator.dart';

class MementoEditorApplication {
  final editor = Editor();
  final snapshots = <Snapshot>[];
}
