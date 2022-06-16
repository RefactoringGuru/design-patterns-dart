# Template Method Pattern
Template Method is a behavioral design pattern that defines the skeleton of an algorithm in the 
superclass but lets subclasses override specific steps of the algorithm without changing its 
structure.

Tutorial: [here](https://refactoring.guru/design-patterns/template-method).

## Diagram:
![image](https://user-images.githubusercontent.com/8049534/174060908-402eea9b-a030-4e45-8e95-54cfcac61bb6.png)

### Client code:
```dart
void main() {
  print('HTMLMiner');
  HTMLMiner('google_workers.html').mine();

  print('CsvMiner');
  CsvMiner('twitter_workers.csv').mine();

  print('GuruMiner');
  ZipMiner('refactoring_guru_workers.zip').mine();
}
```

### Output:
```
HTMLMiner
 Name                  Index
-------------------------------
 Ayana White           33.92
 Dillan Ewing           6.21
 Kimora Arroyo          84.7
 Aspen Simmons         93.08
 Giana Perry           67.56
 Luz Carson            69.88
 Kaleb Pineda          47.87
 Kianna Bautista        3.09
 Jorge Reeves          16.52
 Leroy Morrow          51.24
 Ashlyn Crawford        7.25
 Yasmine Hampton       38.42
-------------------------------
 sum:                 519.74
 len:                     12

CsvMiner
 Name                  Index
-------------------------------
 Laylah Whitehead       22.1
 Karissa Arellano        2.0
 Maggie Mcmahon        12.25
 Ariel Bartlett          8.1
 Rashad Herman           5.8
 Rachael Hickman        5.22
 Tara Spence            9.48
 Kiera Cervantes         4.0
 Shane Robertson         9.0
 Perla Yoder            67.3
-------------------------------
 sum:                 145.25
 len:                     10

ZipMiner
 Name                  Index
-------------------------------
 Dmitry Zhart           62.4
 Alexander Shvets       44.6
 Fishchenko Ilya         1.4
-------------------------------
 sum:                  108.4
 len:                      3
```

