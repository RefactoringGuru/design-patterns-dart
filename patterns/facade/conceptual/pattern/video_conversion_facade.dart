import 'dart:io';

import '../some_complex_media_library/audio_mixer.dart';
import '../some_complex_media_library/bitrate_reader.dart';
import '../some_complex_media_library/codec.dart';
import '../some_complex_media_library/codec_factory.dart';
import '../some_complex_media_library/mpeg4_compression_codec.dart';
import '../some_complex_media_library/ogg_compression_codec.dart';
import '../some_complex_media_library/video_file.dart';

class VideoConversionFacade {
  File convertVideo(String fileName, String format) {
    print('VideoConversionFacade: conversion started.');
    final file = VideoFile(fileName);
    final sourceCodec = CodecFactory.extract(file);
    late final Codec destinationCodec;

    if (format == "mp4") {
      destinationCodec = MPEG4CompressionCodec();
    } else {
      destinationCodec = OggCompressionCodec();
    }

    final buffer = BitrateReader.read(file, sourceCodec);
    final intermediateResult = BitrateReader.convert(buffer, destinationCodec);
    final result = AudioMixer().fix(intermediateResult);
    print('VideoConversionFacade: conversion completed.');

    return result;
  }
}
