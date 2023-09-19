import 'package:base_project/functions/get_header.dart';
import 'package:base_project/functions/show_snackbar.dart';
import 'package:base_project/models/api_models/available_contacts_model.dart';
import 'package:base_project/models/api_models/get_contacts_model.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import '../../View/Chat/HomeChat/HomeChatUi.dart';
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
      print(res);
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
      print(e);
      contactsController.isErrorOccured(true);
      contactsController.isGettingFromServer(false);
    }
  }

  static Future<void> createContact(List<String> selectedId) async {
    ContactsController contactsController = Get.find();
    contactsController.errorCreatingContact(false);
    contactsController.creatingContactDone(false);

    contactsController.creatingContact(true);

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.createContact;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"arrContactIds": selectedId};
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: body);
      if (res.statusCode == 200) {
        contactsController.creatingContact(false);
        contactsController.creatingContactDone(true);
        showCustomSnackbar(
            title: "Contacs added",
            message: "Successfully added ${selectedId.length} contacts");
        Get.off(() => const HomeChatUi());
      }
    } catch (e) {
      contactsController.errorCreatingContact(true);
    }
  }

  static Future<void> getContacts() async {
    ContactsController contactsController = Get.put(ContactsController());
    contactsController.isGetContactErrorOccured(false);
    contactsController.isGetContactLoading(true);

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getContacts;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(url, options: Options(headers: header));
      print(res);
      GetContactsModel model = GetContactsModel.fromJson(res.data);
      print(model.toString());
      contactsController.getContactsModel(null);
      contactsController.getContactsModel(model);
      contactsController.isGetContactLoading(false);
    } catch (e) {
      contactsController.isGetContactErrorOccured(true);
      contactsController.isGetContactLoading(false);
    }
  }
}
