import 'package:geocoding/geocoding.dart';

Future<String> getLocationName(double longitude, double latitude) async {
  // List<Placemark> placemarks =
  //     await placemarkFromCoordinates(latitude, longitude);
  // if (placemarks.isNotEmpty) {
  //   Placemark placemark = placemarks[0];
  //   return "${placemark.street}, ${placemark.locality}, ${placemark.postalCode}";
  // } else {
  //   return "Unknown location";
  // }
  return "Unknown location";
}
