# Design Patterns in Dart
This repository is part of the [**Refactoring.Guru**](https://refactoring.guru/design-patterns) project.
It contains **Dart** examples for all classic **GoF** design patterns.

# Implementation checklist:
- [ ] **Creation**
    - [ ] [**Abstract Factory**](https://refactoring.guru/design-patterns/abstract-factory)
    - [x] [**Builder**](https://refactoring.guru/design-patterns/builder) - [[Color Text Format](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/builder/color_text_format)]
    - [ ] [**Factory Method**](https://refactoring.guru/design-patterns/factory-method)
    - [x] [**Prototype**](https://refactoring.guru/design-patterns/prototype) - [[Shapes](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/prototype/shapes)] 
    - [ ] [**Singleton**](https://refactoring.guru/design-patterns/singleton)
- [ ]  **Behavioral**
    - [x] [**Chain of Responsibility**](https://refactoring.guru/design-patterns/chain-of-esponsibility) - [[Server Middleware](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/chain_of_responsibility/server_middleware)]
    - [x] [**Command**](https://refactoring.guru/design-patterns/command) - [[Text Editor](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/command/text_editor)] 
    - [ ] Interpreter
    - [ ] [**Iterator**](https://refactoring.guru/design-patterns/iterator)
    - [ ] [**Mediator**](https://refactoring.guru/design-patterns/mediator)
    - [x] [**Memento**](https://refactoring.guru/design-patterns/memento) [[Conceptual](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/memento/conceptual)]
    - [x] [**Observer**](https://refactoring.guru/design-patterns/observer) - [[Open-Close Editor Events](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/observer/open_close_editor_events)]
    - [ ] [**State**](https://refactoring.guru/design-patterns/state)
    - [ ] [**Template Method**](https://refactoring.guru/design-patterns/template-method)
    - [ ] [**Visitor**](https://refactoring.guru/design-patterns/visitor)
    - [ ] [**Strategy**](https://refactoring.guru/design-patterns/strategy)
- [ ] **Structural**
    - [x] [**Adapter**](https://refactoring.guru/design-patterns/adapter) - [[Text Graphics](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/adapter/text_graphics)] [[Square Round conflict](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/adapter/square_round_conflict)] 
    - [x] [**Bridge**](https://refactoring.guru/design-patterns/bridge) - [[Remote Device Control](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/bridge/devices_remote_control)] [[Clock](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/bridge/clock)] 
    - [x] [**Composite**](https://refactoring.guru/design-patterns/composite) - [[Image Editor](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/composite/image_editor)] [[Products and Boxes](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/composite/products_and_boxes)] 
    - [x] [**Decorator**](https://refactoring.guru/design-patterns/decorator) - [[Data Source Decoder](https://github.com/RefactoringGuru/design-patterns-dart/tree/master/patterns/decorator/data_source_decoder)]
    - [ ] [**Facade**](https://refactoring.guru/design-patterns/facade)
    - [ ] [**Flyweight**](https://refactoring.guru/design-patterns/flyweight)
    - [ ] [**Proxy**](https://refactoring.guru/design-patterns/proxy)

## Requirements

The examples were written in **Dart 2.15**.

## Contributor's Guide

We appreciate any help, whether it's a simple fix of a typo or a whole new example. Just [make a fork](https://help.github.com/articles/fork-a-repo/), do your change and submit a [pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/).

Here's a style guide which might help you to keep your changes consistent with our code:

1. All code should meet the [Effective Dart: Style](https://dart.dev/guides/language/effective-dart/style).
 
2. Use [Dart Format](https://dart.dev/tools/dart-format) or auto format shortcut `Ctrl + Alt + L` in your ide. 

3. Try to hard wrap the code at 80th's character. It helps to list the code on the website without scrollbars.

4. File names should match following convention: `some_class_name.dart`

5. Comments may or may not have language tags in them, such as this:

    ```dart
    /**
     * EN: All products families have the same varieties (MacOS/Windows).
     *
     * This is a MacOS variant of a button.
     *
     * RU: Все семейства продуктов имеют одни и те же вариации (MacOS/Windows).
     *
     * Это вариант кнопки под MacOS.
     */
    ```

    Don't be scared and ignore the non-English part of such comments. If you want to change something in a comment like this, then do it. Even if you do it wrong, we'll tell you how to fix it during the Pull Request.


## License

This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/80x15.png" /></a>


## Credits

Authors: Alexander Shvets ([@neochief](https://github.com/neochief)), ilopX ([@ilopX](https://github.com/ilopX))
