import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> getOrCreateDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final subDirectory = Directory('${directory.path}/my_files');

  if (!await subDirectory.exists()) {
    await subDirectory.create(recursive: true);
  }

  return subDirectory.path;
}
