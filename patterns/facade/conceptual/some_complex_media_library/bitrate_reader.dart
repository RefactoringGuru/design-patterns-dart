import 'codec.dart';
import 'video_file.dart';

class BitrateReader {
  static VideoFile read(VideoFile file, Codec codec) {
    print('BitrateReader: reading file...');
    return file;
  }

  static VideoFile convert(VideoFile buffer, Codec codec) {
    print('BitrateReader: writing file...');
    return buffer;
  }
}
