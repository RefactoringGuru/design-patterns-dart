# Observer pattern
Observer is a behavioral design pattern that lets you define a subscription mechanism to notify 
multiple objects about any events that happen to the object they’re observing.

Tutorial: [here](https://refactoring.guru/design-patterns/observer).

## Subscriber Flutter Widget example 
This is a complex example of an Observer pattern, connected to a Flutter application. The example includes,
the previously implemented AppObserver template, which you can see 
[here](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/observer/app_observer)

[Online demo](https://ilopx.github.io/design-patterns-dart/#/observer/subscriber_flutter_widget)

### Diagram:
???

### Sequence
???

### Client code:
```dart
void main() {
    // widget that generates a new event
    ElevatedButton(
      child: Text('Generate new hash'),
      onPressed: () {
        final hash = Random().nextDouble().hashCode.toString();
        observer.notify(NewHashEvent(hash));
      },
    );
    
    // widget event consumer NewHashEvent
    SubscriberWidget<NewHashEvent>(
      observer: observer,
      builder: (context, event) {
        return Text(
          (event == null) ? 'Hash no generated' : event.newHash,
        );
      },
    );
}

```

**Output:**
[![image](https://user-images.githubusercontent.com/8049534/152333741-e289b96d-9d86-4f19-8fd5-8d14e374f523.png)](https://ilopx.github.io/design-patterns-dart/#/observer/subscriber_flutter_widget)
