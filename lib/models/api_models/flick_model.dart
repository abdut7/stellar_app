class FlickModel {
  final bool success;
  final String message;
  final int statusCode;
  final List<FlickItem> arrList;

  FlickModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory FlickModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> arrList = json['arrList'];
    List<FlickItem> flickItems = arrList.map((item) {
      return FlickItem.fromJson(item);
    }).toList();

    return FlickModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: flickItems,
    );
  }
}

class FlickItem {
  final String id;
  final bool isCommentEnabled;
  final bool isLikeAndViews;
  final String strFileUrl;
  final String strDescription;
  final String strLocation;
  final String? strThumbnailUrl; // This is optional
  final int likesCount;
  final int commentsCount;
  final bool isFavorite;
  final String strUserId;
  final String strCreatedUserFullName;
  final String strCreatedUserMobNo;
  final String strUserProfileUrl;

  FlickItem({
    required this.id,
    required this.isCommentEnabled,
    required this.isLikeAndViews,
    required this.strFileUrl,
    required this.strDescription,
    required this.strLocation,
    this.strThumbnailUrl,
    required this.likesCount,
    required this.commentsCount,
    required this.isFavorite,
    required this.strUserId,
    required this.strCreatedUserFullName,
    required this.strCreatedUserMobNo,
    required this.strUserProfileUrl,
  });

  factory FlickItem.fromJson(Map<String, dynamic> json) {
    return FlickItem(
      id: json['_id'],
      isCommentEnabled: json['isCommentEnabled'],
      isLikeAndViews: json['isLikeAndViews'],
      strFileUrl: json['strFileUrl'] ?? "",
      strDescription: json['strDescription'],
      strLocation: json['strLocation'],
      strThumbnailUrl: json['strThumbnailUrl'],
      likesCount: json['likesCount'],
      commentsCount: json['commentsCount'],
      isFavorite: json['isFavorite'],
      strUserId: json['strUserId'],
      strCreatedUserFullName: json['strCreatedUserFullName'],
      strCreatedUserMobNo: json['strCreatedUserMobNo'],
      strUserProfileUrl: json['strUserProfileUrl'],
    );
  }
}
