# Observer pattern
**Observer** is a behavioral design pattern that lets you define a subscription mechanism to notify 
multiple objects about any events that happen to the object they’re observing.

Tutorial: [here](https://refactoring.guru/design-patterns/observer).

## Subscriber flutter widget example 
This is a complex example of an Observer pattern, connected to a Flutter application. The example includes,
the previously implemented **AppObserver** example pattern, 
which you can see [here](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/observer/app_observer).

### Online demo:
Click on the picture to see a [demo](https://RefactoringGuru.github.io/design-patterns-dart/#/observer/subscriber_flutter_widget).

[![image](https://user-images.githubusercontent.com/8049534/152419178-f40a07fd-728d-4f99-befa-0935bbdd7b71.png)](https://refactoringguru.github.io/design-patterns-dart/#/observer/subscriber_flutter_widget)

### Client code:
```dart
void main() {
    // generates a new event
      void onHashGenerate() {
        final hash = '...';
        observer.notify(NewHashEvent(hash));
      }
    
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

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/152789070-cc53b0c0-bb5c-4191-ac96-f542ce75c1d7.png)

### Sequence
![image](https://user-images.githubusercontent.com/8049534/152791540-d6ec1d24-a3a1-4340-8805-10df6de12067.png)
