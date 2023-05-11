// ignore_for_file: non_constant_identifier_names

import 'pattern/flyweight_factory.dart';

void main() {
  final factory = FlyweightFactory();

  final one = factory.create('one');
  one.draw();

  final ONE = factory.create('ONE');
  ONE.draw();

  final OnE = factory.create('OnE');
  OnE.draw();

  final two = factory.create('two');
  two.draw();

  final Two = factory.create('Two');
  Two.draw();
}
