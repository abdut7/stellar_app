import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<double> getGoogleMapRadius(GoogleMapController mapController) async {
  // Get the visible region of the map.
  LatLngBounds bounds = await mapController.getVisibleRegion();

  // Calculate the center of the visible region.
  LatLng center = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2);

  // Calculate the radius of the visible region in meters.
  double radius = calculateDistance(center, bounds.northeast);

  return radius;
}

double calculateDistance(LatLng latLng1, LatLng latLng2) {
  double distanceInMeters = Geolocator.distanceBetween(
      latLng1.latitude, latLng1.longitude, latLng2.latitude, latLng2.longitude);

  return distanceInMeters;
}
