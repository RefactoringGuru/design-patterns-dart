# Builder pattern using different text formats as an example

![image](https://user-images.githubusercontent.com/8049534/145697044-7d3e59a9-9f28-4955-a9a2-fcb815f6fb71.png)

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
