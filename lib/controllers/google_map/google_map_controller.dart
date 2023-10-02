import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsController extends GetxController {
  void addOwnLocation({required LatLng latlng}) {
    markerSet.add(Marker(
      markerId: const MarkerId('current_location'),
      infoWindow: const InfoWindow(
        title: 'Current Location',
        snippet: 'This is your current location.',
      ),
      draggable: false,
      position: latlng,
    ));
    update();
  }

  RxSet<Marker> markerSet = RxSet({});
}
