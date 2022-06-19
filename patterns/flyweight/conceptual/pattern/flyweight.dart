import '../params/share_params.dart';

class Flyweight {
  final String localParam;
  final ShareParams shareParams;

  Flyweight(this.localParam, this.shareParams);

  void draw() {
    print('Flyweight(');
    print('\tlocalParam: "$localParam", shareParam: ('
        '${shareParams.param1}, '
        '"${shareParams.param2}", '
        '${shareParams.param3})');
    print(')');
  }
}
