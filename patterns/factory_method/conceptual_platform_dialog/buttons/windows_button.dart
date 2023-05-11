import 'button.dart';

/// EN: Windows button implementation.
///
/// RU: Реализация нативных кнопок операционной системы.
class WindowsButton extends Button {
  WindowsButton(void Function() onClick) : super(onClick);

  @override
  void render() {
    print('Windows Button');
    onClick();
  }
}
