import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stellar_chat/services/api_services/upload_file_service.dart';
import 'package:stellar_chat/services/api_services/upload_files.dart';
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

Future<String?> getThumbnileUrl(String videoFilePath) async {
  final uint8list = await VideoThumbnail.thumbnailData(
    video: videoFilePath,
    imageFormat: ImageFormat.PNG,
    maxWidth:
        200, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
    quality: 100,
  );

  final tempDir = await getTemporaryDirectory();
  final tempFilePath =
      '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';
  final file = File(tempFilePath);
  await file.writeAsBytes(uint8list!);
  String? uploadedFileLink =
      await UploadFileService.uploadFile(filePaths: [file.path]);
  return uploadedFileLink;
}
