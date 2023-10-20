class ChannelModel {
  final bool success;
  final String message;
  final int statusCode;
  final List<ChannelItem> arrList;

  ChannelModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> arrListJson = json['arrList'];
    final List<ChannelItem> channelItems =
        arrListJson.map((item) => ChannelItem.fromJson(item)).toList();
    return ChannelModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: channelItems,
    );
  }
}

class ChannelItem {
  final String id;
  final bool isCommentEnabled;
  final bool isLikeAndViews;
  final String fileUrl;
  final String description;
  final String location;
  final String? thumbnailUrl;
  final String createdTime;
  final int commentsCount;
  final int likesCount;
  final bool isLiked;
  final String userId;
  final String createdUserFullName;
  final String createdUserMobNo;
  final String userProfileUrl;
  final int viewsCount;
  final List<dynamic> followers;
  final int followersCount;
  final List<dynamic> followingStatus;
  final bool isFollowing;

  ChannelItem({
    required this.id,
    required this.isCommentEnabled,
    required this.isLikeAndViews,
    required this.fileUrl,
    required this.description,
    required this.location,
    this.thumbnailUrl,
    required this.createdTime,
    required this.commentsCount,
    required this.likesCount,
    required this.isLiked,
    required this.userId,
    required this.createdUserFullName,
    required this.createdUserMobNo,
    required this.userProfileUrl,
    required this.viewsCount,
    required this.followers,
    required this.followersCount,
    required this.followingStatus,
    required this.isFollowing,
  });

  factory ChannelItem.fromJson(Map<String, dynamic> json) {
    return ChannelItem(
      id: json['_id'],
      isCommentEnabled: json['isCommentEnabled'],
      isLikeAndViews: json['isLikeAndViews'],
      fileUrl: json['strFileUrl'],
      description: json['strDescription'],
      location: json['strLocation'],
      thumbnailUrl: json['strThumbnailUrl'],
      createdTime: json['strCreatedTime'],
      commentsCount: json['commentsCount'],
      likesCount: json['likesCount'],
      isLiked: json['isLiked'],
      userId: json['strUserId'],
      createdUserFullName: json['strCreatedUserFullName'],
      createdUserMobNo: json['strCreatedUserMobNo'],
      userProfileUrl: json['strUserProfileUrl'],
      viewsCount: json['viewsCount'] ?? 0,
      followers: json['followers'] ?? [],
      followersCount: json['followersCount'] ?? 0,
      followingStatus: json['followingStatus'] ?? [],
      isFollowing: json['isFollowing'] ?? false,
    );
  }
}
