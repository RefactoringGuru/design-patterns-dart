# Builder pattern
Using different text formats

![image](https://user-images.githubusercontent.com/8049534/146023073-5d7644a4-d3b9-4420-bffe-f72ac3fd83dd.png)

**Client code:**
```dart
main() {
  final reader = ColorTextReader(
    text: 'I love looking at the blue sky, '
        'eating red apples, '
        'sitting on the green grass.',
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
```
HtmlFormat(
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
),

JsonFormat(
[
  {
    "text": "I love looking at the "
  },
  {
    "text": "blue",
    "color": "blue"
  },
  {
    "text": "sky, eating "
  },
  {
    "text": "red",
    "color": "red"
  },
  {
    "text": "apples, sitting on the "
  },
  {
    "text": "green",
    "color": "green"
  }
]
),

ConsoleFormat(
  I love looking at the blue sky, eating red apples, sitting on the green grass.
),
```
