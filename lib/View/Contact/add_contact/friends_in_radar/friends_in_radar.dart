import 'dart:async';

import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/controllers/google_map/google_map_controller.dart';
import 'package:base_project/functions/location_permission.dart';
import 'package:base_project/services/api_services/get_nearby_contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FriendsInRadarScreen extends StatefulWidget {
  const FriendsInRadarScreen({super.key});

  @override
  State<FriendsInRadarScreen> createState() => _FriendsInRadarScreenState();
}

class _FriendsInRadarScreenState extends State<FriendsInRadarScreen> {
  GoogleMapController? googleMapController;

  CameraPosition pos = CameraPosition(
    target: LatLng(12.355135, 76.6413),
    zoom: 12.0,
  );

  @override
  void initState() {
    super.initState();
  }

  Future<LatLng> getCurrentLocation() async {
    GoogleMapsController mapController = Get.put(GoogleMapsController());
    await requestLocationPermission();
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    mapController.addOwnLocation(
        latlng: LatLng(position.latitude, position.longitude));
    print("${position.latitude}, ${position.longitude}");

    return LatLng(position.latitude, position.longitude);
  }

  LatLng? currentLatLng;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          title: Text(
            'People Near ME',
            style: TextStyle(
              color: SColors.color11,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: SColors.color12,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(SSvgs.appLogo),
          ),
        ),
        body: Obx(
          () {
            final mapController =
                Get.put(GoogleMapsController()); // Get the controller
            return GoogleMap(
              onMapCreated: (controller) async {
                googleMapController = controller;
                currentLatLng = await getCurrentLocation();
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: currentLatLng!,
                      zoom: 12.0,
                    ),
                  ),
                );
              },
              initialCameraPosition: pos,
              markers: Set<Marker>.from(mapController
                  .markerSet), // Use mapController to access markers
              onCameraMove: (position) {
                if (currentLatLng != null && googleMapController != null) {
                  // Cancel the previous timer, if it exists.
                  _timer?.cancel();
                  // Create a new timer to call the getNearbyPeople() function in 5 seconds.
                  _timer = Timer(Duration(seconds: 5), () {
                    GetNearbyContactsService()
                        .getNearbyPeople(googleMapController!, currentLatLng!);
                  });
                }
              },
            );
          },
        ));
  }
}
