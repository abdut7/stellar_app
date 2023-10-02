import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/controllers/google_map/google_map_controller.dart';
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
  GoogleMapController? controller;

  CameraPosition pos = CameraPosition(
    target: LatLng(12.355135, 76.6413),
    zoom: 12.0,
  );

  @override
  void initState() {
    super.initState();
  }

  Future<LatLng> getCurrentLocation() async {
    GoogleMapsController map_controller = Get.put(GoogleMapsController());

    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    map_controller.addOwnLocation(
        latlng: LatLng(position.latitude, position.longitude));

    return LatLng(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapsController map_controller = Get.put(GoogleMapsController());

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
                Get.find<GoogleMapsController>(); // Get the controller
            return GoogleMap(
              onMapCreated: (controller) async {
                LatLng currentLatLng = await getCurrentLocation();
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: currentLatLng,
                      zoom: 12.0,
                    ),
                  ),
                );
              },
              initialCameraPosition: pos,
              markers: Set<Marker>.from(mapController
                  .markerSet), // Use mapController to access markers
            );
          },
        ));
  }
}
