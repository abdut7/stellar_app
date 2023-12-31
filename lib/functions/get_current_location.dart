import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  return position;
}
