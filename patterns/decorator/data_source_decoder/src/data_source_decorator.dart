import 'data_source.dart';

class DataSourceDecorator implements DataSource {
  final DataSource _wrapper;

  DataSourceDecorator(this._wrapper);

  @override
  void writeData(String data) {
    _wrapper.writeData(data);
  }

  @override
  String readData() {
    return _wrapper.readData();
  }
}
