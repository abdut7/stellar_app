import 'package:stellar_chat/view/chat/chat_screen/chat_screen.dart';

import 'package:stellar_chat/controllers/google_map/google_map_controller.dart';
import 'package:stellar_chat/functions/avathar_generator.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/functions/image_to_bitmap.dart';
import 'package:stellar_chat/models/api_models/get_nearby_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Response;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stellar_chat/view/contact/add_contact/friends_in_radar/functions/get_radius.dart';
import 'package:stellar_chat/view/profile/public_profile/public_profile.dart';

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
      print(res);
      GetNearbyPeopleModel model = GetNearbyPeopleModel.fromJson(res.data);
      // ignore: avoid_function_literals_in_foreach_calls
      model.arrList.forEach((element) async {
        if (element.location.coordinates.isEmpty) {
          return;
        }
        List<BitmapDescriptor> bitmapList =
            await avatharGenerator([element.strProfileUrl]);
        // BitmapDescriptor dis =
        //     await getBitmapDescriptorFromNetworkImage(element.strProfileUrl);
        gController.markerSet.add(
          Marker(
              markerId: MarkerId("${gController.markerSet.length}"),
              icon: bitmapList.first,
              position: LatLng(element.location.coordinates.first,
                  element.location.coordinates.last),
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  context: Get.context!,
                  builder: (context) {
                    return Container(
                        color: const Color.fromRGBO(159, 196, 232, 1),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.string(
                                """<svg width="184" height="6" viewBox="0 0 184 6" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M3 3H181" stroke="#00338E" stroke-opacity="0.5" stroke-width="5" stroke-linecap="round"/>
</svg>
"""),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(element.strProfileUrl),
                                  radius: 50,
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 16),
                                    Text(
                                      element.strFullName,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Get.to(() => PrivateChatScreen(
                                                    imageUrl:
                                                        element.strProfileUrl,
                                                    chatId: element.id,
                                                    fullName:
                                                        element.strFullName,
                                                  ));
                                            },
                                            child: const Text('Chat',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                ))),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                () => PublicProfileScreen(
                                                    uid: element.id),
                                              );
                                            },
                                            child: const Text('View Profile',style:TextStyle(
          fontFamily: 'Inter',))),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ));
                  },
                );
              }),
        );
      });
    } catch (e) {
      print(e);
    }
  }
}
