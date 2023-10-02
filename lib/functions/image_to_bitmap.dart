import 'dart:typed_data';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future<BitmapDescriptor> getBitmapDescriptorFromNetworkImage(String imageUrl) async {
  // Get the image bytes from the network.
  http.Response response = await http.get(Uri.parse(imageUrl));
  Uint8List imageBytes = response.bodyBytes;

  // Create a new ImageConfiguration object.
  // ImageConfiguration imageConfiguration = ImageConfiguration.empty;

  // Create a new BitmapDescriptor object from the image bytes.
  BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromBytes(imageBytes);

  // Return the BitmapDescriptor object.
  return bitmapDescriptor;
}