import 'dart:io';

void main() async {
  await init();

  final prepareRepository = Future.microtask(() async {
    await cloneOriginRepository();
    await fetchUpstream();
  });

  final buildProject = Future.microtask(() async {
    await buildWebProject();
  });

  await Future.wait([prepareRepository, buildProject]);

  prepareIndexHtmlForRemoteHost();
  copyFiles();
  await pushToOrigin();
  clear();
}

 final tmpDir = Directory.systemTemp.createTempSync();
 final projectDir = thisPath(r'..\');
 final webBuildDir = Directory(projectDir.uri.toFilePath() + r'build\web');
late final String originUrl;

Future<void> init() async {
  print('Use temp: $tmpDir');
  originUrl = await repositoryOriginUrl(projectDir);
}

Future<void> buildWebProject() async {
  final flutterTargetFile = '${projectDir.path}bin\\main.dart';
  print('Build web app: $flutterTargetFile');
  await cmd('flutter build web -t $flutterTargetFile');
}

Future<void> cloneOriginRepository() async {
  print('Cloning origin: [web-demos] $originUrl');
  await cmd(
    'git clone -b web-demos --single-branch $originUrl .',
    workingDirectory: tmpDir,
  );
}

Future<void> fetchUpstream() async {
  final shvets = r'https://github.com/RefactoringGuru/design-patterns-dart.git';
  print('Fetch upstream: [web-demos] $shvets');
  await cmd('git remote add upstream $shvets', workingDirectory: tmpDir);
  await cmd('git fetch upstream', workingDirectory: tmpDir);
}

void prepareIndexHtmlForRemoteHost() {
  print('Prepare "index.html" for remote host.');

  final indexHtmlFile = File(webBuildDir.path + r'\index.html');
  final indexContent = indexHtmlFile.readAsStringSync();
  final fixedIndexContent = indexContent.replaceFirst(
    r'<base href="/">',
    r'<base href="/design-patterns-dart/">',
  );

  if (indexContent == fixedIndexContent) {
    throw 'Base url not found. It should be <base href="/">';
  }

  indexHtmlFile.writeAsStringSync(fixedIndexContent);
}

void copyFiles() {
  print('Copy files:');
  copyDirectory(webBuildDir, tmpDir);
}

Future<void> pushToOrigin() async {
  await cmd('git add .', workingDirectory: tmpDir);
  await cmd(
    'git commit -m ${await lastProjectCommit()}',
    workingDirectory: tmpDir,
    showOut: true,
  );

  print('Push to origin: [web-demos] $originUrl');
  await cmd(
    'git push origin web-demos',
    workingDirectory: tmpDir,
    showOut: true,
  );
}

void clear() {
  print('Clear: $tmpDir');
  tmpDir.deleteSync(recursive: true);
}

Future<String> cmd(
  String command, {
  Directory? workingDirectory,
  bool showOut = false,
}) async {
  var process = await Process.run(
    command,
    [],
    workingDirectory: workingDirectory?.path,
    runInShell: true,
  );

  if (showOut) {
    print(process.stdout);
  }

  if (process.exitCode != 0) {
    print(command);
    print(process.stderr);
    clear();
    exit(process.exitCode);
  }

  return process.stdout;
}

Future<String> repositoryOriginUrl(Directory workingDir) async {
  final raw = await cmd(
    'git remote show origin',
    workingDirectory: workingDir,
  );
  final url = RegExp('Push  URL: (.+)\n').firstMatch(raw)?.group(1);

  if (url == null) {
    throw Exception('Empty Remote repository');
  }

  return url;
}

Future<String> lastProjectCommit() async {
  final rawCommit =
      await cmd('git log -1 --pretty=%B', workingDirectory: projectDir);
  final formatCommit = rawCommit.replaceAll(' ', '_').replaceAll('&', '');
  return 'auto_commit:_$formatCommit';
}

Directory thisPath(String name) {
  final dir = Platform.script.pathSegments
          .sublist(0, Platform.script.pathSegments.length - 1)
          .join(Platform.pathSeparator) +
      Platform.pathSeparator +
      name;

  return Directory(Uri.directory(dir).normalizePath().toFilePath());
}

void copyDirectory(Directory source, Directory target) {
  if (!target.existsSync()) {
    target.createSync();
  }

  for (final entry in source.listSync()) {
    final newPath = updatePath(entry, source, target);

    if (entry is File) {
      copyFile(entry, newPath);
    } else if (entry is Directory) {
      copyDirectory(entry, Directory(newPath));
    } else {
      throw Exception(
        'FileSystemEntity is not recognized. It must be a file or a directory',
      );
    }
  }
}

void copyFile(File entry, String newFileName) {
  print('\t${removerBuildPath(entry)}');
  entry.copySync(newFileName);
}

String updatePath(
  FileSystemEntity entry,
  Directory source,
  Directory target,
) {
  return entry.path
      .replaceFirst(source.path, target.path + Platform.pathSeparator)
      .replaceAll(r'\\', r'\');
}

String removerBuildPath(FileSystemEntity target) {
  return target.path.replaceFirst(webBuildDir.path, '').substring(1);
}
