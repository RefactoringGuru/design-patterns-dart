import '../buttons/button.dart';

abstract class Dialog {
  void renderWindow() {
    /// EN: ... other code ...
    ///
    /// RU: ... остальной код диалога ...

    Button okButton = createButton(() {
      print('Click! Button says - "Hello World!"');
    });
    okButton.render();
  }

  /// EN: Subclasses will override this method in order to create specific
  /// button objects.
  ///
  /// RU: Подклассы будут переопределять этот метод, чтобы создавать конкретные
  /// объекты продуктов, разные для каждой фабрики.
  Button createButton(void Function() onClick);
}
