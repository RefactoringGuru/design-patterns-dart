# Strategy Pattern
Strategy is a behavioral design pattern that lets you define a family of algorithms, put each of 
them into a separate class, and make their objects interchangeable.

Tutorial: [here](https://refactoring.guru/design-patterns/strategy).

## Diagram:
![image](https://user-images.githubusercontent.com/8049534/175562829-c91fbb12-50ac-4373-a33f-900527383a6c.png)

## Client code:
```dart
void main() {
  final byteList = ByteContext()
    ..add('Hello guru')
    ..add(123456789)
    ..add(3.1456564984);

  final strFormat = byteList.toStringView(StrViewStrategy());
  final hexFormat = byteList.toStringView(HexViewStrategy());
  final zipFormat = byteList.toStringView(ZipViewStrategy());

  print(strFormat);
  print(hexFormat);
  print(zipFormat);
}
```

### Output:
```
StrViewStrategy:
Hello guru, 123456789, 3.1456564984

HexViewStrategy:
Hello guru     : 48 65 6c 6c 6f 20 67 75 72 75
123456789      : 00 00 00 00 07 5b cd 15
3.1456564984   : 40 09 2a 4d f4 48 9f 7e

ZipViewStrategy:
1f 8b 08 00 00 00 00 00 00 0a f3 48 cd c9 c9 57 
48 2f 2d 2a d5 51 30 34 32 36 31 35 33 b7 b0 d4 
51 30 d6 33 04 32 4d cd 4c 2c 2d 4c b8 00 d4 70 
cf ee 24 00 00 00 
```
