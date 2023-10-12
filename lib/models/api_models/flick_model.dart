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
    return FlickModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: (json['arrList'] as List)
          .map((itemJson) => FlickItem.fromJson(itemJson))
          .toList(),
    );
  }
}

class FlickItem {
  final String id;
  final String chrStatus;
  final bool isCommentEnabled;
  final bool isLikeAndViews;
  final String strFileUrl;
  final String strDescription;
  final String strLocation;
  final String strCreatedBy;
  final String strCreatedTime;
  final Tag objTags;
  final String strThumbnailUrl;
  final List<TaggedUser> taggedUsers;

  FlickItem({
    required this.id,
    required this.chrStatus,
    required this.isCommentEnabled,
    required this.isLikeAndViews,
    required this.strFileUrl,
    required this.strDescription,
    required this.strLocation,
    required this.strCreatedBy,
    required this.strCreatedTime,
    required this.objTags,
    required this.taggedUsers,
    required this.strThumbnailUrl,
  });

  factory FlickItem.fromJson(Map<String, dynamic> json) {
    return FlickItem(
      id: json['_id'],
      chrStatus: json['chrStatus'],
      isCommentEnabled: json['isCommentEnabled'],
      isLikeAndViews: json['isLikeAndViews'],
      strFileUrl: json['strFileUrl'],
      strDescription: json['strDescription'],
      strLocation: json['strLocation'],
      strCreatedBy: json['strCreatedBy'],
      strCreatedTime: json['strCreatedTime'],
      strThumbnailUrl: json['strThumbnailUrl'] ?? "",
      objTags: Tag.fromJson(json['objTags']),
      taggedUsers: (json['taggedUsers'] as List)
          .map((userJson) => TaggedUser.fromJson(userJson))
          .toList(),
    );
  }
}

class Tag {
  final String id;
  final String strUserId;
  final String strFlickId;
  final String strCreatedTime;
  final String chrStatus;
  final String strCreatedBy;

  Tag({
    required this.id,
    required this.strUserId,
    required this.strFlickId,
    required this.strCreatedTime,
    required this.chrStatus,
    required this.strCreatedBy,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['_id'],
      strUserId: json['strUserId'],
      strFlickId: json['strFlickId'],
      strCreatedTime: json['strCreatedTime'],
      chrStatus: json['chrStatus'],
      strCreatedBy: json['strCreatedBy'],
    );
  }
}

class TaggedUser {
  final String id;
  final String chrStatus;
  final String strOTPToken;
  final String strName;
  final String strFullName;
  final String strRegion;
  final String strMobileNo;
  final String strEmail;
  final String strSignupMethode;
  final String strQRCodeUrls;
  final String strType;
  final bool isNearby;

  TaggedUser({
    required this.id,
    required this.chrStatus,
    required this.strOTPToken,
    required this.strName,
    required this.strFullName,
    required this.strRegion,
    required this.strMobileNo,
    required this.strEmail,
    required this.strSignupMethode,
    required this.strQRCodeUrls,
    required this.strType,
    required this.isNearby,
  });

  factory TaggedUser.fromJson(Map<String, dynamic> json) {
    return TaggedUser(
      id: json['_id'],
      chrStatus: json['chrStatus'],
      strOTPToken: json['strOTPToken'],
      strName: json['strName'],
      strFullName: json['strFullName'],
      strRegion: json['strRegion'],
      strMobileNo: json['strMobileNo'],
      strEmail: json['strEmail'],
      strSignupMethode: json['strSignupMethode'],
      strQRCodeUrls: json['strQRCodeUrls'],
      strType: json['strType'],
      isNearby: json['isNearby'] ?? false,
    );
  }
}
