import 'dart:convert';
import 'dart:io';

Future<String> filePathToBase(String path,) async {
  List<int> imageBytes = await File(path).readAsBytes();
  return base64Encode(imageBytes);
}
