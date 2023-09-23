class GroupDetailsResponseModel {
  GroupDetailsResponseModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.strGroupName,
    required this.strCreatedTime,
    required this.strDiscription,
    required this.strIconURL,
    required this.strCreatedBy,
    required this.intParticipants,
    required this.groupUser,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final String strGroupName;
  late final String strCreatedTime;
  late final String strDiscription;
  late final String strIconURL;
  late final String strCreatedBy;
  late final int intParticipants;
  late final List<GroupUser> groupUser;

  GroupDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    strGroupName = json['strGroupName'];
    strCreatedTime = json['strCreatedTime'];
    strDiscription = json['strDiscription'];
    strIconURL = json['strIconURL'];
    strCreatedBy = json['strCreatedBy'];
    intParticipants = json['intParticipants'];
    groupUser = List.from(json['arrUserList'])
        .map((e) => GroupUser.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['strGroupName'] = strGroupName;
    _data['strCreatedTime'] = strCreatedTime;
    _data['strDiscription'] = strDiscription;
    _data['strIconURL'] = strIconURL;
    _data['strCreatedBy'] = strCreatedBy;
    _data['intParticipants'] = intParticipants;
    _data['arrUserList'] = groupUser.map((e) => e.toJson()).toList();
    return _data;
  }
}

class GroupUser {
  GroupUser({
    required this.id,
    required this.strUserId,
    required this.isAdmin,
    required this.isCreatedUser,
    required this.strGroupId,
    required this.strFullName,
    required this.strMobileNo,
    required this.strProfileIcon,
  });
  late final String id;
  late final String strUserId;
  late final bool isAdmin;
  late final bool isCreatedUser;
  late final String strGroupId;
  late final String strFullName;
  late final String strMobileNo;
  late final String strProfileIcon;

  GroupUser.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    strUserId = json['strUserId'];
    isAdmin = json['isAdmin'];
    isCreatedUser = json['isCreatedUser'];
    strGroupId = json['strGroupId'];
    strFullName = json['strFullName'];
    strMobileNo = json['strMobileNo'];
    strProfileIcon = json['strProfileIcon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['strUserId'] = strUserId;
    _data['isAdmin'] = isAdmin;
    _data['isCreatedUser'] = isCreatedUser;
    _data['strGroupId'] = strGroupId;
    _data['strFullName'] = strFullName;
    _data['strMobileNo'] = strMobileNo;
    _data['strProfileIcon'] = strProfileIcon;
    return _data;
  }
}
