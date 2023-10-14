import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';
import 'package:path/path.dart' as path;

Future<void> downloadCacheAndOpenFile(String fileUrl) async {
  final cacheManager = DefaultCacheManager();
  File? file;
  FileInfo? fileInfo = await cacheManager.getFileFromCache(fileUrl);
  if (fileInfo != null) {
    file = fileInfo.file;
  }

  if (fileInfo == null || !await fileInfo.file.exists()) {
    final dio = Dio();
    try {
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
    } on Exception catch (e) {
      showCustomSnackbar(title: "Error opening file", message: "");
    }
  }

  if (fileInfo != null && await fileInfo.file.exists()) {
    final filePath = fileInfo.file.path;
    final result = await OpenFile.open(filePath);

    if (result.type == ResultType.noAppToOpen) {
      // Handle the case where no app is found to open the file.
      print("No app found to open the file");
    }
    return;
  } else if (file != null) {
    final result = await OpenFile.open(file.path);

    if (result.type == ResultType.noAppToOpen) {
      // Handle the case where no app is found to open the file.
      print("No app found to open the file");
    }
  }
}

Future<bool> isFileCached(String fileUrl) async {
  fileUrl = fileUrl.trim();
  final cacheManager = DefaultCacheManager();
  FileInfo? fileInfo = await cacheManager.getFileFromCache(fileUrl);
  return fileInfo != null && fileInfo.file.existsSync();
}
