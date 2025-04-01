// ignore_for_file: unused_local_variable

import 'pattern/video_conversion_facade.dart';

void main() {
  final converter = VideoConversionFacade();
  final mp4Video = converter.convertVideo("youtubevideo.ogg", "mp4");
  // ...;
}
