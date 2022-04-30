import '../buttons/button.dart';
import '../buttons/html_button.dart';
import 'dialog.dart';

/// EN: HTML Dialog will produce HTML buttons.
///
/// RU: HTML-диалог.
class HtmlDialog extends Dialog {
  @override
  Button createButton(void Function() onClick) => HtmlButton(onClick);
}
