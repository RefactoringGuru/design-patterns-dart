# Observer pattern
**Observer** is a behavioral design pattern that lets you define a subscription mechanism to notify 
multiple objects about any events that happen to the object they’re observing.

Tutorial: [here](https://refactoring.guru/design-patterns/observer).

## Subscriber Flutter Widget example 
This is a complex example of an Observer pattern, connected to a Flutter application. The example includes,
the previously implemented **AppObserver** example pattern, which you can see [here](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/observer/app_observer).

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/152418114-f040bcb4-3bf5-4581-8b9b-a264e103ff76.png)

### Sequence
![image](https://user-images.githubusercontent.com/8049534/152418299-3f6f3e5d-7132-42bc-9b27-11ed53ca6434.png)

### Client code:
```dart
void main() {
    // widget that generates a new event
    ElevatedButton(
      child: Text('Generate new hash'),
      onPressed: () {
        final hash = 'some hash';
        observer.notify(NewHashEvent(hash));
      },
    );
    
    // widget event consumer NewHashEvent
    SubscriberWidget<NewHashEvent>(
      observer: observer,
      builder: (context, event) {
        return Text(
          event?.newHash ?? 'Hash no generated' ,
        );
      },
    );
}
```

### Online demo:
Click on the picture to see a [demo](https://ilopx.github.io/design-patterns-dart/#/observer/subscriber_flutter_widget).

[![image](https://user-images.githubusercontent.com/8049534/152419178-f40a07fd-728d-4f99-befa-0935bbdd7b71.png)](https://ilopx.github.io/design-patterns-dart/#/observer/subscriber_flutter_widget)
