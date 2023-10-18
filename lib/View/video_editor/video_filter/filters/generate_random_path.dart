// Function to generate a new random file path with a given extension
import 'dart:math';

import 'package:path/path.dart';

String generateRandomFilePath(String directoryPath, String extension) {
  final random = Random();
  final fileName = DateTime.now().millisecondsSinceEpoch.toString() +
      '_' +
      random.nextInt(9999).toString();
  return join(directoryPath, '$fileName.$extension');
}
