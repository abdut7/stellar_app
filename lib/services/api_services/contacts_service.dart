import 'package:base_project/functions/get_header.dart';
import 'package:base_project/models/api_models/available_contacts_model.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import '/controllers/contacts_controller.dart';

class ContactServiceApi {
  static Future<void> contactService(List<String> contacts) async {
    ContactsController contactsController = Get.find();
    contactsController.isGettingFromServer(true);

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getStellarContacts;
    Map<String, dynamic> header = await getHeader();
    Map<String, List<String>> body = {"arrContacts": contacts};
    try {
      Response res = await dio.post(
        url,
        data: body,
        options: Options(headers: header),
      );
      AvailableContactsModel availableContactsModel =
          AvailableContactsModel.fromJson(res.data);

      if (availableContactsModel.statusCode == 200) {
        contactsController.availableContactsModel(availableContactsModel);
        contactsController.isErrorOccured(false);
      } else {
        contactsController.isErrorOccured(true);
      }

      contactsController.isGettingFromServer(false);
    } catch (e) {
      contactsController.isErrorOccured(true);
      contactsController.isGettingFromServer(false);
    }
  }
}
