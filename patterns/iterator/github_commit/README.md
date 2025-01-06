# Iterator pattern
Iterator is a behavioral design pattern that lets you traverse elements of a collection without 
exposing its underlying representation (list, stack, tree, etc.).

Tutorial: [here](https://refactoring.guru/design-patterns/iterator).

## Diagram:
![image](https://user-images.githubusercontent.com/8049534/183165928-7274e761-09e3-48ce-b9c1-41d552fa1f1a.png)


### Client code:
```dart
void main() async {
  final GitHubRepo gitHubRepo = await GitHubLoader.get(
    userName: 'RefactoringGuru',
    repoName: 'design-patterns-dart',
  );

  print(
    'Iterate last 10 commits.'
        '\n----------------------------',
  );

  for (Commit commit in gitHubRepo.commitIterator()) {
    print(commit.message);
  }
}
```

### Output:
```
Iterate last 10 commits.
----------------------------
Merge pull request #74 from ilopX/fix-conceptual-command-pattern-folder-name Fix conceptual command pattern folder name
Fix conceptual command pattern folder name.
Merge pull request #73 from ilopX/add-conceptual-command-pattern Add conceptual command pattern
Bump version 0.35.0.
Add README.
Impl conceptual command pattern.
Merge pull request #72 from ilopX/add-singleton-pattern Add singleton pattern.
Bump version 0.34.0.
Add README.
```

