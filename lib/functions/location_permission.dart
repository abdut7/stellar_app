import 'package:geolocator/geolocator.dart';


Future<void> requestLocationPermission() async {
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    // Handle the case when the user denies permission
    
  } else if (permission == LocationPermission.deniedForever) {
    // Handle the case when the user denies permission forever
  } else {
    // Permission granted; you can now retrieve the user's location
  }
}
