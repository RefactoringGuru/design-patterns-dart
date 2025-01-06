import 'github/commit.dart';
import 'github/github_loader.dart';
import 'pattern/github_repo.dart';

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
