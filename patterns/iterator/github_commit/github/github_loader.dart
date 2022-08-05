import 'dart:convert';
import 'dart:io';
import '../pattern/github_repo.dart';

class GitHubLoader {
  static Future<GitHubRepo> get({required userName, required repoName}) async {
    final url = Uri.http(
      'api.github.com',
      'repos/$userName/$repoName/commits',
      {'per_page': '10'},
    );
    final json = await _loadCommits(url);
    return GitHubRepo(json);
  }

  static Future<List<dynamic>> _loadCommits(Uri url) async {
    final client = HttpClient();
    try {
      final response = await client.getUrl(url);
      final request = await response.close();
      final content = await request.transform(utf8.decoder).join();
      return jsonDecode(content);
    } finally {
      client.close();
    }
  }
}
