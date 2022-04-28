# Observer pattern
Observer is a behavioral design pattern that lets you define a subscription mechanism to notify 
multiple objects about any events that happen to the object they’re observing.

Tutorial: [here](https://refactoring.guru/design-patterns/observer).

## AppObserver example 
This example was created to be used in a more complex examples:
- [[SubscriberWidget](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/observer/subscriber_flutter_widget)]
- [[FlutterAdapter](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/adapter/flutter_adapter)]
- [[MementoEditor](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/memento/memento_editor)]

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/152783537-0c39c119-2e5b-44fb-9be1-a88840c7f7a1.png)

### Sequence
![image](https://user-images.githubusercontent.com/8049534/152049996-72131655-402d-4b92-b5d0-10e3f2dd0e79.png)

### Client code:
```dart
void main() {
  final observer = AppObserver();

  observer.subscribe<FirstEvent>((e) {
    print('First');
  });


  observer.subscribe((SecondEvent e) {
    print('Second');
  });

  final saveThirdEvent = observer.subscribe((ThirdEvent e) {
    print('Third');
  });

  observer.notify(FirstEvent());
  observer.notify(SecondEvent());
  observer.notify(ThirdEvent());

  print('---unsubscribe "ThirdEvent"---');
  observer.unsubscribe(saveThirdEvent);

  observer.notify(FirstEvent());
  observer.notify(SecondEvent());
  observer.notify(ThirdEvent());
}
```

**Output:**
```
First
Second
Third
---unsubscribe "ThirdEvent"---
First
Second
```
