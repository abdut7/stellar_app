import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/controllers/user_controller.dart';
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
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return LatLng(position.latitude, position.longitude);
  }

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
      body: GoogleMap(
        onMapCreated: (controller) async {
          controller = controller;
          LatLng cureentLatLang = await getCurrentLocation();
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: cureentLatLang,
                zoom: 12.0,
              ),
            ),
          );
        },
        initialCameraPosition: pos,
        markers: {
          Marker(
              markerId: MarkerId('current_location'),
              infoWindow: InfoWindow(
                title: 'Current Location',
                snippet: 'This is your current location.',
              ),
              draggable: true,
              position: LatLng(12.355135, 75.3557917)),
        },
      ),
    );
  }
}
