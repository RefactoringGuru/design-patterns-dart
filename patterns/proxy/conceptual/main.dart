import 'pattern/proxy.dart';
import 'pattern/subject.dart';

void main() async {
  final subject = Proxy();
  client(subject); // print "Proxy data"

  print('Wait 2 seconds...');
  await Future.delayed(Duration(seconds: 2));

  client(subject); // print "Real data"
}

void client(Subject subject) {
  print(subject.request());
}
