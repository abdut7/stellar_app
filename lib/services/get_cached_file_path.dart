import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as path;

Future<String?> getCachedFilePath(String fileUrl) async {
  final cacheManager = DefaultCacheManager();
  File? file;
  FileInfo? fileInfo = await cacheManager.getFileFromCache(fileUrl);
  if (fileInfo != null) {
    file = fileInfo.file;
  }

  if (fileInfo == null || !await fileInfo.file.exists()) {
    final dio = Dio();
    final response = await dio.get(fileUrl,
        options: Options(responseType: ResponseType.bytes));

    if (response.statusCode == 200) {
      // Determine the file extension based on your knowledge or from response headers.
      final uri = Uri.parse(fileUrl);
      final fileExtension = path.extension(uri.path);

      // Save the file with the specified file extension.
      file = await cacheManager.putFile(
        fileUrl,
        response.data,
        fileExtension: fileExtension,
      );
    }
  }

  if (fileInfo != null && await fileInfo.file.exists()) {
    final filePath = fileInfo.file.path;
    return filePath;
  } else if (file != null) {
    return file.path;
  }
}
