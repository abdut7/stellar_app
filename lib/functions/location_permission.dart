import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


// Future<void> requestLocationPermission() async {
//   LocationPermission permission = await Geolocator.requestPermission();
//   if (permission == LocationPermission.denied) {
//     // Handle the case when the user denies permission
    
//   } else if (permission == LocationPermission.deniedForever) {
//     // Handle the case when the user denies permission forever
//   } else {
//     // Permission granted; you can now retrieve the user's location
//   }
// }


// Function to request location permission
Future<void> requestLocationPermission() async {
  final status = await Permission.locationWhenInUse.request();

  if (status.isGranted) {
    // Permission granted
    print('Location permission granted');
  } else if (status.isDenied) {
    // Permission denied
    print('Location permission denied');
  } else if (status.isPermanentlyDenied) {
    // Permission permanently denied, navigate to settings
    print('Location permission permanently denied');
    openAppSettings(); // Opens app settings on Android
  }
}

