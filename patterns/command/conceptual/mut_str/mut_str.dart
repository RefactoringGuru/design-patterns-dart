class MutStr {
  void push(String str) {
    _buff.addAll(str.split(''));
  }

  void insert(int pos, String str) {
    _buff.insert(pos, str);
  }

  void delete(int startPos, int len) {
    _buff.removeRange(startPos, len);
  }

  int get len => _buff.length;

  @override
  String toString() {
    return _buff.join('');
  }

  final _buff = <String>[];
}
