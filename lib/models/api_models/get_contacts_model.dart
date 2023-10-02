class GetContactsModel {
  GetContactsModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<ArrList> arrList;

  GetContactsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    arrList =
        List.from(json['arrList']).map((e) => ArrList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['arrList'] = arrList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ArrList {
  ArrList({
    required this.id,
    required this.recievedPhoneUser,
  });
  late final String id;
  late final List<RecievedPhoneUser> recievedPhoneUser;

  ArrList.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    recievedPhoneUser = List.from(json['objUser'])
        .map((e) => RecievedPhoneUser.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['objUser'] = recievedPhoneUser.map((e) => e.toJson()).toList();
    return _data;
  }
}

class RecievedPhoneUser {
  RecievedPhoneUser({
    required this.id,
    required this.strFullName,
    required this.strMobileNo,
    required this.strProfileUrl,
  });
  late final String id;
  late final String strFullName;
  late final String strMobileNo;
  late final String strProfileUrl;

  RecievedPhoneUser.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    strFullName = json['strFullName'];
    strMobileNo = json['strMobileNo'];
    strProfileUrl = json['strProfileUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['strFullName'] = strFullName;
    _data['strMobileNo'] = strMobileNo;
    _data['strProfileUrl'] = strProfileUrl;
    return _data;
  }
}
