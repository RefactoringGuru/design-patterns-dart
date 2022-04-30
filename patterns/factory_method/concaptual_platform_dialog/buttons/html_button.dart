import 'button.dart';

/// EN: HTML button implementation.
///
/// RU: Реализация HTML кнопок.
class HtmlButton extends Button {
  HtmlButton(void Function() onClick) : super(onClick);

  @override
  void render() {
    print('<button>Test Button</button>');
    onClick();
  }
}
