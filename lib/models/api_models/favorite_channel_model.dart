class ChannelModelFavorites {
  final bool success;
  final String message;
  final int statusCode;
  final List<FavoriteChannelItem> arrList;
  final int count;

  ChannelModelFavorites({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
    required this.count,
  });

  factory ChannelModelFavorites.fromJson(Map<String, dynamic> json) {
    var arrList = json['arrList'] as List;
    List<FavoriteChannelItem> arrListData =
        arrList.map((item) => FavoriteChannelItem.fromJson(item)).toList();

    return ChannelModelFavorites(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: arrListData,
      count: json['count'],
    );
  }
}

class FavoriteChannelItem {
  final String id;
  final int commentsCount;
  final int likesCount;
  final bool isLiked;
  final String strChannelId;
  final bool isCommentEnabled;
  final bool isLikeAndViews;
  final String strFileUrl;
  final String strDescription;
  final String strLocation;
  final String strThumbnailUrl;
  final String strCreatedTime;
  final String strUserId;
  final String strCreatedUserFullName;
  final String strCreatedUserMobNo;
  final String strUserProfileUrl;
  final bool isFavorite;

  FavoriteChannelItem({
    required this.id,
    required this.commentsCount,
    required this.likesCount,
    required this.isLiked,
    required this.strChannelId,
    required this.isCommentEnabled,
    required this.isLikeAndViews,
    required this.strFileUrl,
    required this.strDescription,
    required this.strLocation,
    required this.strThumbnailUrl,
    required this.strCreatedTime,
    required this.strUserId,
    required this.strCreatedUserFullName,
    required this.strCreatedUserMobNo,
    required this.strUserProfileUrl,
    required this.isFavorite,
  });

  factory FavoriteChannelItem.fromJson(Map<String, dynamic> json) {
    return FavoriteChannelItem(
      id: json['_id'],
      commentsCount: json['commentsCount'],
      likesCount: json['likesCount'],
      isLiked: json['isLiked'],
      strChannelId: json['strChannelId'],
      isCommentEnabled: json['isCommentEnabled'],
      isLikeAndViews: json['isLikeAndViews'],
      strFileUrl: json['strFileUrl'],
      strDescription: json['strDescription'],
      strLocation: json['strLocation'],
      strThumbnailUrl: json['strThumbnailUrl'],
      strCreatedTime: json['strCreatedTime'],
      strUserId: json['strUserId'],
      strCreatedUserFullName: json['strCreatedUserFullName'],
      strCreatedUserMobNo: json['strCreatedUserMobNo'],
      strUserProfileUrl: json['strUserProfileUrl'],
      isFavorite: json['isFavorite'],
    );
  }
}
