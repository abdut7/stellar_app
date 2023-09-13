class AvailableContactsModel {
  AvailableContactsModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<ArrList> arrList;

  AvailableContactsModel.fromJson(Map<String, dynamic> json) {
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
    required this.chrStatus,
    required this.strName,
    required this.strFullName,
    required this.strRegion,
    required this.strMobileNo,
    required this.strEmail,
    required this.strSignupMethode,
    required this.strQRCodeUrls,
    required this.strType,
    required this.strProfileUrl,
    required this.strHashPassword,
    required this.location,
    required this.strCreatedTime,
  });
  late final String id;
  late final String chrStatus;
  late final String strName;
  late final String strFullName;
  late final String strRegion;
  late final String strMobileNo;
  late final String strEmail;
  late final String strSignupMethode;
  late final String strQRCodeUrls;
  late final String strType;
  late final String strProfileUrl;
  late final String strHashPassword;
  late final Location location;
  late final String strCreatedTime;

  ArrList.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    chrStatus = json['chrStatus'];
    strName = json['strName'];
    strFullName = json['strFullName'];
    strRegion = json['strRegion'];
    strMobileNo = json['strMobileNo'];
    strEmail = json['strEmail'];
    strSignupMethode = json['strSignupMethode'];
    strQRCodeUrls = json['strQRCodeUrls'];
    strType = json['strType'];
    strProfileUrl = json['strProfileUrl'];
    strHashPassword = json['strHashPassword'];
    location = Location.fromJson(json['location']);
    strCreatedTime = json['strCreatedTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['chrStatus'] = chrStatus;
    _data['strName'] = strName;
    _data['strFullName'] = strFullName;
    _data['strRegion'] = strRegion;
    _data['strMobileNo'] = strMobileNo;
    _data['strEmail'] = strEmail;
    _data['strSignupMethode'] = strSignupMethode;
    _data['strQRCodeUrls'] = strQRCodeUrls;
    _data['strType'] = strType;
    _data['strProfileUrl'] = strProfileUrl;
    _data['strHashPassword'] = strHashPassword;
    _data['location'] = location.toJson();
    _data['strCreatedTime'] = strCreatedTime;
    return _data;
  }
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });
  late final String type;
  late final List<double> coordinates;

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}
