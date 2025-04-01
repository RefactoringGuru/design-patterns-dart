import '../github/commit.dart';

class GitHubRepo {
  GitHubRepo(this._json);

  Iterable<Commit> commitIterator() sync* {
    for (final jsonCommit in _json) {
      var message = jsonCommit['commit']['message'] as String;
      message = message.replaceAll(RegExp(r'\n+'), ' ');

      yield Commit(message);
    }
  }

  final List<dynamic> _json;
}
