import '../shapes/compound_shape.dart';
import '../shapes/dot.dart';
import '../shapes/rectangle.dart';
import '../shapes/shape.dart';
import 'visitor.dart';

class XMLExportVisitor implements Visitor {
  final buff = StringBuffer();

  String export(Shape shape) {
    buff.clear();
    _write('<?xml version="1.0" encoding="utf-8">?');
    shape.accept(this);
    return buff.toString().trim();
  }

  @override
  void visitCompoundShape(CompoundShape compound) {
    _write('<compound>', openTag: true);
    _write('<x>${compound.x}</x>');
    _write('<y>${compound.y}</y>');
    _write('<children>', openTag: true);

    for (final shape in compound.children) {
      shape.accept(this);
    }

    _write('</children>', closeTag: true);
    _write('</compound>', closeTag: true);
  }

  @override
  void visitCircle(circle) {
    _write('<circle>', openTag: true);
    _write('<xCenter>${circle.xCenter}</xCenter>');
    _write('<yCenter>${circle.yCenter}</yCenter>');
    _write('<radius>${circle.radius}</radius>');
    _write('</circle>', closeTag: true);
  }

  @override
  void visitDot(Dot dot) {
    _write('<dot>', openTag: true);
    _write('<x>${dot.x}</x>');
    _write('<y>${dot.y}</y>');
    _write('</dot>', closeTag: true);
  }

  @override
  void visitRectangle(Rectangle rectangle) {
    _write('<rectangle>', openTag: true);
    _write('<x>${rectangle.x}</x>');
    _write('<y>${rectangle.y}</y>');
    _write('<width>${rectangle.width}</width>');
    _write('<height>${rectangle.height}</height>');
    _write('</rectangle>', closeTag: true);
  }

  int _openTags = 0;

  void _write(String str, {openTag = false, closeTag = false}) {
    if (closeTag) {
      _openTags--;
    }

    final tab = '  ' * _openTags;
    buff.writeln(tab + str);

    if (openTag) {
      _openTags++;
    }
  }
}
