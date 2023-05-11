import 'flyweight.dart';
import '../params/share_params.dart';
import '../utils/fake_value.dart';

class FlyweightFactory {
  Flyweight create(String localParam) {
    final shareParams = _shares.putIfAbsent(
      localParam.toLowerCase(),
      () => ShareParams(
        fakeInt,
        fakeString,
        fakeDouble,
      ),
    );

    return Flyweight(localParam, shareParams);
  }

  final _shares = <String, ShareParams>{};
}
