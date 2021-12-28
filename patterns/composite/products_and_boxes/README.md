# Composite pattern

![problem-en](https://user-images.githubusercontent.com/8049534/147579298-0c60c4a7-6acb-4ab3-a973-e06524c5a061.png)

**Description:**
https://refactoring.guru/design-patterns/composite?#problem

**Diagram:**

![image](https://user-images.githubusercontent.com/8049534/147579175-f5ce6191-a76a-4f1f-8ac9-fae1a26f87bb.png)

**Client code:**
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
