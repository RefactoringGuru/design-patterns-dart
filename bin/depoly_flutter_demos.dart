import 'dart:io';

void main() async {
  init();
  buildWebProject();
  cloneOriginRepository();
  fetchUpstream();
  copyFiles();
  pushToOrigin();
  clear();
}

void init() {
  print('Use temp $tmpDir');
}

void buildWebProject() {
  print('Build web app.');
  final projectPath = projectDir;
  cmd(
    r'flutter build web -t bin\main.dart --web-renderer html',
    projectPath,
  );
}

void cloneOriginRepository() {
  final repository = originRemoteUrl();
  print('Cloning origin: $repository');
  cmd(
    'git clone -b web-demos --single-branch $repository .',
    tmpDir,
  );
}

void fetchUpstream() {
  final shvets = r'https://github.com/RefactoringGuru/design-patterns-dart.git';
  print('Fetch upstream: $shvets');
  cmd('git remote add upstream $shvets', tmpDir);
  cmd('git fetch upstream', tmpDir);
}

void copyFiles() {
  print('Copy files:');
  copyDirectory(webBuildDir, tmpDir);
}

void pushToOrigin() {
  cmd('git add .', tmpDir);
  cmd('git commit -m ${lastProjectCommit()}', tmpDir, showOut: true);
  print('Push to origin:');
  cmd('git push origin web-demos', tmpDir, showOut: true);
}

late final tmpDir = Directory.systemTemp.createTempSync();
late final projectDir = thisPath(r'..\');
late final webBuildDir = Directory(projectDir.uri.toFilePath() + r'build\web');

void clear() {
  print('Clear $tmpDir');
  tmpDir.deleteSync(recursive: true);
}

String cmd(String command, Directory workingDirectory, {bool showOut = false}) {
  var process = Process.runSync(
    command,
    [],
    workingDirectory: workingDirectory.path,
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

String originRemoteUrl() {
  final raw = cmd(
    'git remote show origin',
    projectDir,
  );
  final url = RegExp('Push  URL: (.+)\n').firstMatch(raw)?.group(1);

  if (url == null) {
    throw Exception('Empty Remote repository');
  }

  return url;
}

String lastProjectCommit() {
  final rawCommit = cmd('git log -1 --pretty=%B', projectDir);
  final formatCommit = rawCommit.replaceAll(' ', '_');
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
