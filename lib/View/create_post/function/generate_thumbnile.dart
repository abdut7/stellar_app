import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';

Future<Uint8List?> generateVideoThumbnail(String videoFilePath) async {
  final uint8list = await VideoThumbnail.thumbnailData(
    video: videoFilePath,
    imageFormat: ImageFormat.PNG,
    maxWidth:
        200, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
    quality: 100,
  );
  return uint8list;
}
