class GetContactsModel {
  final bool success;
  final String message;
  final int statusCode;
  final List<Contact> arrList;

  GetContactsModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory GetContactsModel.fromJson(Map<String, dynamic> json) {
    List<Contact> contacts = [];
    if (json['arrList'] != null) {
      contacts = List<Contact>.from(
        json['arrList'].map((contact) => Contact.fromJson(contact)),
      );
    }
    
    return GetContactsModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: contacts,
    );
  }
}

class Contact {
  final String id;
  final String strFullName;
  final String strMobileNo;
  final String strEmail;
  final String strProfileUrl;

  Contact({
    required this.id,
    required this.strFullName,
    required this.strMobileNo,
    required this.strEmail,
    required this.strProfileUrl,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['_id'],
      strFullName: json['strFullName'],
      strMobileNo: json['strMobileNo'],
      strEmail: json['strEmail'],
      strProfileUrl: json['strProfileUrl'],
    );
  }
}
