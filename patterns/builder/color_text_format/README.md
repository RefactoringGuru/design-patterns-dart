# Builder pattern
Builder is a creational design pattern that lets you construct complex objects step by step.

**General description of the pattern:**
https://refactoring.guru/design-patterns/builder

## Example 
Using different text formats. 

### Class diagram
![image](https://user-images.githubusercontent.com/8049534/165747411-75d587d4-aa16-4a14-a16d-52f3fa461a11.png)

### Client code:
```dart
main() {
  final reader = ColorTextReader(
    text: 'I love looking at the blue sky, eating red apples and sitting on the green grass.',
  );

  final html = reader.convert(HtmlConverter());
  final json = reader.convert(JsonConverter());
  final console = reader.convert(ConsoleConverter());

  print(
    '$html,n\n'
    '$json,\n\n'
    '$console,\n\n',
  );
}
```

**Output:**
```html
<!DOCTYPE html>
  <html>
  <head>
  <title>Color text</title>
    <style>
      .blue { color: blue; }
      .red { color: red; }
      .green { color: green; }
    </style>
  </head>
  <body>
  <p>
   I love looking at the
   <span class="blue">blue</span> sky, eating
   <span class="red">red</span> apples, sitting on the
   <span class="green">green</span> grass. </p>
  </body>
</html>
```
```json
[
  {
    "text": "I love looking at the "
  },
  {
    "color": "blue"
  },
  {
    "text": "sky, eating "
  },
  {
    "color": "red"
  },
  {
    "text": "apples, sitting on the "
  },
  {
    "color": "green"
  },
  {
    "text": "grass. "
  }
]
```
![image](https://user-images.githubusercontent.com/8049534/150763802-9d21f8b7-011d-4ff5-bb53-5d8a3d6d1d4c.png)

