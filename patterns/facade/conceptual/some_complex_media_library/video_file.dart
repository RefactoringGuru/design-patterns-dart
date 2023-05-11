class VideoFile {
  final String name;
  final String codecType;

  VideoFile(this.name) : codecType = name.substring(name.indexOf('.') + 1);
}
