class GetNearbyPeopleModel {
  final bool success;
  final String message;
  final int statusCode;
  final List<User> arrList;

  GetNearbyPeopleModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory GetNearbyPeopleModel.fromJson(Map<String, dynamic> json) {
    final List<User> users = (json['arrList'] as List)
        .map((userJson) => User.fromJson(userJson))
        .toList();

    return GetNearbyPeopleModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: users,
    );
  }
}

class User {
  final String id;
  final String strFullName;
  final String strMobileNo;
  final String strEmail;
  final String strProfileUrl;

  User({
    required this.id,
    required this.strFullName,
    required this.strMobileNo,
    required this.strEmail,
    required this.strProfileUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      strFullName: json['strFullName'],
      strMobileNo: json['strMobileNo'],
      strEmail: json['strEmail'],
      strProfileUrl: json['strProfileUrl'],
    );
  }
}
