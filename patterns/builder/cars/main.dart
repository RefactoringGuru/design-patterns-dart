import 'builders/car_builder.dart';
import 'builders/car_manual_builder.dart';
import 'director/director.dart';

/// EN: Use-case. Everything comes together here.
///
/// RU: Пример использования. Здесь всё сводится воедино.
void main() {
  final director = Director();

  // EN: Director gets the concrete builder object from the client
  // (application code). That's because application knows better which
  // builder to use to get a specific product.
  //
  // RU: Директор получает объект конкретного строителя от клиента
  // (приложения). Приложение само знает какой строитель использовать,
  // чтобы получить нужный продукт.
  final builder = CarBuilder();
  director.constructSportsCar(builder);

  // EN: The final product is often retrieved from a builder object, since
  // Director is not aware and not dependent on concrete builders and
  // products.
  //
  // RU: Готовый продукт возвращает строитель, так как Директор чаще всего
  // не знает и не зависит от конкретных классов строителей и продуктов.
  final car = builder.getResult();
  print('Car built:\n${car.carType}\n');

  final manualBuilder = CarManualBuilder();

  // EN: Director may know several building recipes.
  //
  // RU: Директор может знать больше одного рецепта строительства
  director.constructSportsCar(manualBuilder);
  final carManual = manualBuilder.getResult();
  print("Car manual built:\n${carManual.print()}");
}
