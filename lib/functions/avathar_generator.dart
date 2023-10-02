import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img; // Import the image package
import 'package:http/http.dart' as http;

Future<List<BitmapDescriptor>> avatharGenerator(
    List<String> imageUrlList) async {
  List<BitmapDescriptor> bitList = [];

  for (String imageUrl in imageUrlList) {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      final Uint8List customIconUint8List = response.bodyBytes;
      img.Image? originalImage = img.decodeImage(customIconUint8List);

      if (originalImage != null) {
        // Apply circular mask to the image
        img.Image circularImage = img.copyCropCircle(originalImage);
        img.Image resizedImage = img.copyResize(circularImage,
            width: 140, height: 140); // Make it square

        Uint8List resizedUint8List =
            Uint8List.fromList(img.encodePng(resizedImage));
        bitList.add(BitmapDescriptor.fromBytes(resizedUint8List));
      }
    }
  }

  return bitList;
}
