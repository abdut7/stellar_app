import 'package:base_project/functions/get_contacts.dart';
import 'package:base_project/functions/get_header.dart';
import 'package:base_project/models/api_models/available_contacts_model.dart';
import 'package:base_project/models/api_models/get_contacts_model.dart';
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

  static Future<void> createContact(List<String> newPhoneNumber) async {
    ContactsController contactsController = Get.find();

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.createContact;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"arrContacts": newPhoneNumber};
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: body);
      if (res.statusCode == 200) {
        GetContactsModel model = GetContactsModel.fromJson(res.data);
        for (var element in model.arrList) {
          contactsController.phoneNumberUserList.add(element);
        }
      }
    } catch (e) {
      // contactsController.errorCreatingContact(true);
    }
  }

  static Future<void> getContacts() async {
    ContactsController contactsController = Get.put(ContactsController());
    contactsController.isGetContactErrorOccured(false);
    contactsController.isGetContactLoading(true);

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getContacts;
    Map<String, dynamic> header = await getHeader();
    List<String> incomingContacts = [];

    try {
      // get contact from db
      Response res = await dio.post(url, options: Options(headers: header));
      GetContactsModel model = GetContactsModel.fromJson(res.data);
      // contactsController.getContactsModel(null);
      // contactsController.getContactsModel(model);
      //adding each contact to the phone number user list
      List<Contact> userList = [];
      for (var element in model.arrList) {
        userList.add(element);
      }
      contactsController.phoneNumberUserList.addAll(userList);
      contactsController.isGetContactLoading(false);

      // contactsController.phoneNumberUserList.addAll(model.arrList)
      for (var element in model.arrList) {
        incomingContacts.add(element.strMobileNo);
      }
    } catch (e) {
      print(e);
      contactsController.isGetContactErrorOccured(true);
      contactsController.isGetContactLoading(false);
    }
    //fetching contact from directory
    List<String> phoneContacts = await getContactsFromPhone();
    // removing already existing contact
    phoneContacts.removeWhere((element) => incomingContacts.contains(element));
    // pass the phone numbers to add to contact
    ContactServiceApi.createContact(phoneContacts);
  }

  static Future<void> searchContacts(String query) async {
    ContactsController contactsController = Get.put(ContactsController());
    contactsController.isGetContactErrorOccured(false);
    contactsController.isGetContactLoading(true);

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getStellarContacts;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> data = {"strSearch": query};
    Response res =
        await dio.post(url, options: Options(headers: header), data: data);
    print(res);
    GetContactsModel model = GetContactsModel.fromJson(res.data);
    print(model.toString());
    contactsController.getContactsModel(null);
    contactsController.getContactsModel(model);
    contactsController.isGetContactLoading(false);
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
      GetContactsModel model = GetContactsModel.fromJson(res.data);
      print(model.toString());
      contactsController.getContactsModel(null);
      contactsController.getContactsModel(model);
      contactsController.isGetContactLoading(false);
    } catch (e) {
      print(e);
      contactsController.isGetContactErrorOccured(true);
      contactsController.isGetContactLoading(false);
    }
  }
}
