import 'editor/editor.dart';
import 'listeners/email_notification_listener.dart';
import 'listeners/log_open_listener.dart';

void main() {
  final editor = Editor();
  editor.events
    ..subscribe(
      'open',
      LogOpenListener('log.txt'),
    )
    ..subscribe(
      'save',
      EmailNotificationListener('admin@example.com'),
    );

  try {
    editor.openFile('test.txt');
    editor.saveFile();
  } catch (e) {
    print(e);
  }
}
