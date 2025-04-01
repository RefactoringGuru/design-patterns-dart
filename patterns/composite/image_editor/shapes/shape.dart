import '../editor/image_editor.dart';

abstract class Shape {
  int get x;

  int get y;

  int get width;

  int get height;

  void move(int x, int y);

  void select();

  void unSelect();

  bool get isSelected;

  void paint(Graphics graphics);
}
