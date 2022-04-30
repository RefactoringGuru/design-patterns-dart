/// EN: Common interface for all buttons.
///
/// RU: Общий интерфейс для всех продуктов.
abstract class Button {
  final void Function() onClick;

  Button(this.onClick);

  void render();
}
