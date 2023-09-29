class UserDetailsModel {
  UserDetailsModel({
    required this.success,
    required this.message,
    required this.statusCode,
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
    required this.strBirthday,
    required this.location,
    required this.strCreatedTime,
    required this.strOTPToken,
    required this.followersCount,
    required this.followingCount,
    required this.isFollowing,
    required this.isFollower,
    required this.isBlocked,
    required this.intPostCount,
    required this.intFlickCount,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
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
  late final String strBirthday;
  late final Location location;
  late final String strCreatedTime;
  late final String strOTPToken;
  late final int followersCount;
  late final int followingCount;
  late final bool isFollowing;
  late final bool isFollower;
  late final bool isBlocked;
  late final int intPostCount;
  late final int intFlickCount;

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
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
    strBirthday = json['strBirthday'];
    location = Location.fromJson(json['location']);
    strCreatedTime = json['strCreatedTime'];
    strOTPToken = json['strOTPToken'];
    followersCount = json['followersCount'];
    followingCount = json['followingCount'];
    isFollowing = json['isFollowing'];
    isFollower = json['isFollower'];
    isBlocked = json['isBlocked'];
    intPostCount = json['intPostCount'];
    intFlickCount = json['intFlickCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
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
    _data['strBirthday'] = strBirthday;
    _data['location'] = location.toJson();
    _data['strCreatedTime'] = strCreatedTime;
    _data['strOTPToken'] = strOTPToken;
    _data['followersCount'] = followersCount;
    _data['followingCount'] = followingCount;
    _data['isFollowing'] = isFollowing;
    _data['isFollower'] = isFollower;
    _data['isBlocked'] = isBlocked;
    _data['intPostCount'] = intPostCount;
    _data['intFlickCount'] = intFlickCount;
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
