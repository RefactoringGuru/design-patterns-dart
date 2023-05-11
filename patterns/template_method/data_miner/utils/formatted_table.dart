class FormattedTable {
  void addRow(a, b) {
    _buff.writeln(
      '${' ' * 1}${a.padRight(20)}${b.toString().padLeft(7)}',
    );
  }

  void addLine() {
    _buff.writeln('-' * 31);
  }

  @override
  String toString() {
    return _buff.toString();
  }

  final _buff = StringBuffer();
}
