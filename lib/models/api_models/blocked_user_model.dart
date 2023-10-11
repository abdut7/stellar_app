class BlockedUsersResponseModel {
  BlockedUsersResponseModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.blockedUsers,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<BlockedUsers> blockedUsers;

  BlockedUsersResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    blockedUsers = List.from(json['arrList'])
        .map((e) => BlockedUsers.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['arrList'] = blockedUsers.map((e) => e.toJson()).toList();
    return _data;
  }
}

class BlockedUsers {
  BlockedUsers({
    required this.id,
    required this.strUserId,
    required this.strFullName,
    required this.strMobileNo,
    required this.strProfileIcon,
  });
  late final String id;
  late final String strUserId;
  late final String strFullName;
  late final String strMobileNo;
  late final String strProfileIcon;

  BlockedUsers.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    strUserId = json['strUserId'];
    strFullName = json['strFullName'] ?? "";
    strMobileNo = json['strMobileNo']??"";
    strProfileIcon = json['strProfileIcon']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['strUserId'] = strUserId;
    _data['strFullName'] = strFullName;
    _data['strMobileNo'] = strMobileNo;
    _data['strProfileIcon'] = strProfileIcon;
    return _data;
  }
}
