import 'dart:io';

void main() async {
  buildWebProject();
  cloneRemoteRepository();
  updateFiles();
  pushToOrigin();
  clear();
}

void buildWebProject() {
  print('Build web app ...');
  final projectPath = thisPath(r'..\');
  cmd(
    r'flutter build web -t bin\main.dart --web-renderer html',
    Directory(projectPath),
  );
}

void cloneRemoteRepository() {
  final repository = originRemoteUrl();
  cmd(
    'git clone -b web-demos --single-branch $repository .',
    tmpDir,
    showOut: true,
  );
}

void updateFiles() {
  final webDir = Directory(thisPath(r'..\build\web\'));
  copyDirectory(webDir, tmpDir);
}

void pushToOrigin() {
  cmd('git add .', tmpDir);
  cmd('git commit -m \'auto_commit\'', tmpDir, showOut: true);
  cmd('git push origin web-demos', tmpDir, showOut: true);
}

late final tmpDir = Directory.systemTemp.createTempSync();

void clear() {
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
    print(process.stderr);
    clear();
    exit(process.exitCode);
  }

  return process.stdout;
}

String originRemoteUrl() {
  final raw = cmd(
    'git remote show origin',
    Directory(thisPath(r'..\')),
    showOut: true,
  );
  final url = RegExp('Push  URL: (.+)\n').firstMatch(raw)?.group(1);

  if (url == null) {
    throw Exception('Empty Remote repository');
  }

  return url;
}

String thisPath(String name) =>
    Platform.script.pathSegments
        .sublist(0, Platform.script.pathSegments.length - 1)
        .join(Platform.pathSeparator) +
    Platform.pathSeparator +
    name;

void copyDirectory(Directory source, Directory target) {
  for (final entry in source.listSync()) {
    final newFilePath = entry.path.replaceFirst(
      source.path,
      target.path + Platform.pathSeparator,
    );

    if (entry is File) {
      entry.copySync(newFilePath);
    } else if (entry is Directory) {
      final target = Directory(newFilePath)..createSync(recursive: true);
      copyDirectory(entry, target);
    } else {
      throw Error();
    }
  }
}
