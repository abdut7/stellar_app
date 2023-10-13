class FollowModel {
  bool success;
  String message;
  int statusCode;
  List<FollowItem> followList;

  FollowModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.followList,
  });

  factory FollowModel.fromJson(Map<String, dynamic> json) {
    return FollowModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      followList: (json['arrList'] as List)
          .map((item) => FollowItem.fromJson(item))
          .toList(),
    );
  }
}

class FollowItem {
  String id;
  String userId;
  String fullName;
  String mobileNo;
  String profileIcon;

  FollowItem({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.mobileNo,
    required this.profileIcon,
  });

  factory FollowItem.fromJson(Map<String, dynamic> json) {
    return FollowItem(
      id: json['_id'],
      userId: json['strUserId'],
      fullName: json['strFullName'],
      mobileNo: json['strMobileNo'],
      profileIcon: json['strProfileIcon'],
    );
  }
}
