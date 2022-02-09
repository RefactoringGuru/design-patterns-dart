# Composite pattern
Composite is a structural design pattern that lets you compose objects into tree structures and then
work with these structures as if they were individual objects.

## Example: Products and boxes
![problem-en](https://user-images.githubusercontent.com/8049534/147579298-0c60c4a7-6acb-4ab3-a973-e06524c5a061.png)

For example, imagine that you have two types of objects: Products and Boxes. A Box can contain 
several Products as well as a number of smaller Boxes. These little Boxes can also hold some 
Products or even smaller Boxes, and so on.

Full description can be found [here](https://refactoring.guru/design-patterns/composite?#problem)

### Folder description:
- `/products` - represent product and box (composite pattern)
- `/diagram` - convert products to render elements
- `/render_elements` - classes for visualization (real-world composite pattern)

### Diagram:

![image](https://user-images.githubusercontent.com/8049534/147579175-f5ce6191-a76a-4f1f-8ac9-fae1a26f87bb.png)

### Client code:
```dart
main() {
  Box(
    children: [
      Box.single(
        ProductLeaf('Hammer', 9),
      ),
      Box(
        children: [
          Box(
            children: [
              Box.single(
                ProductLeaf('Phone', 450),
              ),
              Box.single(
                ProductLeaf('Headphones', 30),
              ),
            ],
          ),
          Box.single(
            ProductLeaf('Charger', 25),
          ),
        ],
      ),
      ProductLeaf('Receipt', 0),
    ],
  );
}
```

**Output:**
```
                              ┌─────────────────────────────┐                                
                              │ Box(places: 5, price: 514$) │                                
                              └──────────────┬──────────────┘                                
       ┌─────────────────────────────────────┼─────────────────────────────────────┐         
 ┌─────┴───┐                 ┌───────────────┴─────────────┐                       ┴         
 │ Box(9$) │                 │ Box(places: 3, price: 505$) │                  Receipt(0$)    
 └────┬────┘                 └──────────────┬──────────────┘                                 
      │                            ┌────────┴────────────────────┐                           
      ┴             ┌──────────────┴──────────────┐        ┌─────┴────┐                      
  Hammer(9$)        │ Box(places: 2, price: 480$) │        │ Box(25$) │                      
                    └──────────────┬──────────────┘        └─────┬────┘                      
                        ┌──────────┴────────┐                    │                           
                  ┌─────┴─────┐       ┌─────┴────┐               ┴                           
                  │ Box(450$) │       │ Box(30$) │         Charger(25$)                      
                  └─────┬─────┘       └─────┬────┘                                           
                        │                   │                                                
                        ┴                   ┴                                                
                   Phone(450$)       Headphones(30$)                                         
                                                                                             
```
