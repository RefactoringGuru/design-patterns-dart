import 'codec.dart';
import 'mpeg4_compression_codec.dart';
import 'ogg_compression_codec.dart';
import 'video_file.dart';

class CodecFactory {
  static Codec extract(VideoFile file) {
    String type = file.codecType;
    if (type == 'mp4') {
      print('CodecFactory: extracting mpeg audio...');
      return MPEG4CompressionCodec();
    } else {
      print('CodecFactory: extracting ogg audio...');
      return OggCompressionCodec();
    }
  }
}
