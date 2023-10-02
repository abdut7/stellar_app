import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/functions/avathar_generator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsController extends GetxController {
  UserController controller = Get.find();
  void addOwnLocation({required LatLng latlng}) async {
    List<BitmapDescriptor> avatharList = await avatharGenerator(
        [controller.userDetailsModel.value!.strProfileUrl]);
    markerSet.add(Marker(
        markerId: const MarkerId('current_location'),
        infoWindow: const InfoWindow(
          title: 'Current Location',
          snippet: 'This is your current location.',
        ),
        draggable: false,
        position: latlng,
        icon: avatharList.first));
    update();
  }

  RxSet<Marker> markerSet = RxSet({});
}
