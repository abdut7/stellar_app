import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/functions/get_location_name.dart';
import 'package:stellar_chat/functions/location_permission.dart';
import 'package:stellar_chat/services/socket_service/group_chat_service.dart';
import 'package:stellar_chat/services/socket_service/private_chat_service.dart';

class SendLocationScreen extends StatefulWidget {
  final bool isFromGroup;
  final String chatId;

  const SendLocationScreen(
      {super.key, required this.isFromGroup, required this.chatId});
  @override
  _SendLocationScreenState createState() => _SendLocationScreenState();
}

class _SendLocationScreenState extends State<SendLocationScreen> {
  late GoogleMapController _mapController;
  late LatLng _userLocation;
  late double _latitude;
  late double _longitude;

  @override
  void initState() {
    super.initState();

    _getLocation();
  }

  Set<Marker> markers = {};

  String fetchedAddress = "";
  void _getLocation() async {
    await requestLocationPermission();
    Position position = await Geolocator.getCurrentPosition();
    _userLocation = LatLng(position.latitude, position.longitude);
    _latitude = position.latitude;
    _longitude = position.longitude;
    _mapController.moveCamera(CameraUpdate.newLatLng(_userLocation));
    fetchedAddress = await getLocationName(_latitude, _longitude);

    Marker marker = Marker(
      markerId: const MarkerId('user_location'),
      position: _userLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    markers.add(marker);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          title: Text(
            'Your\nLocation',
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
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
            _getLocation();
          },
          initialCameraPosition: const CameraPosition(
            target: LatLng(0.0, 0.0),
            zoom: 15.0,
          ),
          markers: markers,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: Get.height * 0.2,
          width: Get.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(153, 199, 255, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SvgPicture.string(
                        """<svg width="23" height="29" viewBox="0 0 23 29" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <g clip-path="url(#clip0_2333_4312)">
                  <path d="M11.5 0C5.14851 0 0 4.73229 0 10.5703C0 19.6689 7.8347 26.5577 10.5704 28.6874C11.107 29.1052 11.893 29.1052 12.4296 28.6874C15.1653 26.5592 23 19.6689 23 10.5703C23 4.73229 17.8515 0 11.5 0ZM11.5 15.2822C8.66857 15.2822 6.3737 13.1728 6.3737 10.5703C6.3737 7.96778 8.66857 5.85843 11.5 5.85843C14.3314 5.85843 16.6263 7.96778 16.6263 10.5703C16.6263 13.1728 14.3314 15.2822 11.5 15.2822Z" fill="#00338E"/>
                  </g>
                  <defs>
                  <clipPath id="clip0_2333_4312">
                  <rect width="23" height="29" fill="white"/>
                  </clipPath>
                  </defs>
                  </svg>
                  """),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Send Selected Location",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        fetchedAddress,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (widget.isFromGroup) {
                    GroupChatService.sentGroupLocationMessage(
                        chatId: widget.chatId,
                        longitude: _longitude,
                        latitude: _latitude);
                  } else {
                    PrivateChatService.sentPersonalLocationMessage(
                        chatId: widget.chatId,
                        longitude: _longitude,
                        latitude: _latitude);
                  }
                  Get.back();
                },
                child: Container(
                  width: Get.width * 0.5,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 51, 142, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
