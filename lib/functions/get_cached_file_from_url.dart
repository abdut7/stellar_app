import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<File> getFile(String url) async {
  File file = await DefaultCacheManager().getSingleFile(url);
  return file;
}