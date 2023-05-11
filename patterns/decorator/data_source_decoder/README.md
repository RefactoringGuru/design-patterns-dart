# Pattern Decorator
Decorator is a structural design pattern that lets you attach new behaviors to objects by placing these objects inside special wrapper objects that contain the behaviors.

## Data source decoder example
In this example, the Decorator pattern lets you compress and encrypt sensitive data independently 
from the code that actually uses this data.

Full description can be found [here](https://refactoring.guru/design-patterns/decorator?#pseudocode)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/148954932-edc22d7b-becd-4e2f-bae8-d0d8200d8918.png)

### Client code:
```dart
void main() {
  final records = 'Name,Salary\nJohn Smith,100000\nSteven Jobs,912000';

  // Create encrypt file
  DataSourceDecorator encoded = CompressionDecorator(
    EncryptionDecorator(
      FileDataSource('Secret.txt'),
    ),
  );
  encoded.writeData(records);

  DataSource plain = FileDataSource('Secret.txt');
  print("- Input ----------------");
  print(records);
  print("\n- Encoded --------------");
  print(plain.readData());
  print("\n- Decoded --------------");
  print(encoded.readData());
}
```

**Output:**
```
- Input ----------------
Name,Salary
John Smith,100000
Steven Jobs,912000

- Encoded --------------
STV0SkJCQkJCQkJCRHdPTXtGNFdEVjhOVFR6cjZRTUx7OWlVRE44T01Ob1JOVVJCQmI4aGx1VHoyRXhHczB6bFppMk1SelBoRkJCOHhaTzlOQkJCQkI+Pg==

- Decoded --------------
Name,Salary
John Smith,100000
Steven Jobs,912000
```
