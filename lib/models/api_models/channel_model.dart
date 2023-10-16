class ChannelModel {
  bool success;
  String message;
  int statusCode;
  List<ChannelItem> arrList;

  ChannelModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> arrListJson = json['arrList'];
    List<ChannelItem> arrList = arrListJson.map((item) {
      return ChannelItem.fromJson(item);
    }).toList();

    return ChannelModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: arrList,
    );
  }
}

class ChannelItem {
  String id;
  bool isCommentEnabled;
  bool isLikeAndViews;
  String strFileUrl;
  String strDescription;
  String strLocation;
  String? strThumbnailUrl;
  DateTime strCreatedTime;
  int likesCount;
  int commentsCount;
  bool isLiked;
  String strUserId;
  String strCreatedUserFullName;
  String strCreatedUserMobNo;
  String strUserProfileUrl;

  ChannelItem({
    required this.id,
    required this.isCommentEnabled,
    required this.isLikeAndViews,
    required this.strFileUrl,
    required this.strDescription,
    required this.strLocation,
    this.strThumbnailUrl,
    required this.strCreatedTime,
    required this.likesCount,
    required this.commentsCount,
    required this.isLiked,
    required this.strUserId,
    required this.strCreatedUserFullName,
    required this.strCreatedUserMobNo,
    required this.strUserProfileUrl,
  });

  factory ChannelItem.fromJson(Map<String, dynamic> json) {
    return ChannelItem(
      id: json['_id'],
      isCommentEnabled: json['isCommentEnabled'],
      isLikeAndViews: json['isLikeAndViews'],
      strFileUrl: json['strFileUrl'],
      strDescription: json['strDescription'],
      strLocation: json['strLocation'],
      strThumbnailUrl: json['strThumbnailUrl'],
      strCreatedTime: DateTime.parse(json['strCreatedTime']),
      likesCount: json['likesCount'],
      commentsCount: json['commentsCount'],
      isLiked: json['isLiked'],
      strUserId: json['strUserId'],
      strCreatedUserFullName: json['strCreatedUserFullName'],
      strCreatedUserMobNo: json['strCreatedUserMobNo'],
      strUserProfileUrl: json['strUserProfileUrl'],
    );
  }
}
