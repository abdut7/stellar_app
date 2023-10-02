import 'package:base_project/View/contact/add_contact/friends_in_radar/functions/get_radius.dart';
import 'package:base_project/controllers/google_map/google_map_controller.dart';
import 'package:base_project/functions/get_header.dart';
import 'package:base_project/models/api_models/get_nearby_model.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetNearbyContactsService {
  GoogleMapsController gController = Get.put(GoogleMapsController());
  Future<void> getNearbyPeople(
      GoogleMapController mapController, LatLng latlang) async {
    double radius = await getGoogleMapRadius(mapController);
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getContacts;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {
      "coordinates": [latlang.latitude, latlang.longitude],
      "radius": radius
    };
    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: body);
      GetNearbyPeopleModel model = GetNearbyPeopleModel.fromJson(res.data);
      model.arrList.forEach((element) {
        gController.markerSet.add(
          Marker(
              markerId: MarkerId("${gController.markerSet.length}"),
              position: latlang),
        );
      });
    } catch (e) {
      print(e);
    }
  }
}
