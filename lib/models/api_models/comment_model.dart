class CommentResponseModel {
  final bool success;
  final String message;
  final int statusCode;
  final List<CommentItem> arrList;

  CommentResponseModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> arrListJson = json['arrList'] ?? [];
    final arrList =
        arrListJson.map((item) => CommentItem.fromJson(item)).toList();

    return CommentResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      arrList: arrList,
    );
  }
}

class CommentItem {
  final String id;
  final String strComment;
  final String strFlickId;
  final String strCreatedBy;
  final bool isLiked;
  final int likeCount;
  final String strCreatedUser;
  final String strCreatedUserId;
  final String strCreatedUserProfile;
  final String strCreatedTime;

  CommentItem(
      {required this.id,
      required this.strComment,
      required this.strFlickId,
      required this.strCreatedBy,
      required this.isLiked,
      required this.likeCount,
      required this.strCreatedUser,
      required this.strCreatedUserId,
      required this.strCreatedUserProfile,
      required this.strCreatedTime});

  factory CommentItem.fromJson(Map<String, dynamic> json) {
    return CommentItem(
      strCreatedTime: json["strCreatedTime"],
      id: json['_id'] ?? '',
      strComment: json['strComment'] ?? '',
      strFlickId: json['strFlickId'] ?? '',
      strCreatedBy: json['strCreatedBy'] ?? '',
      isLiked: json['isLiked'] ?? false,
      likeCount: json['likeCount'] ?? 0,
      strCreatedUser: json['strCreatedUser'] ?? '',
      strCreatedUserId: json['strCreatedUserId'] ?? '',
      strCreatedUserProfile: json['strCreatedUserProfile'] ?? '',
    );
  }
}
