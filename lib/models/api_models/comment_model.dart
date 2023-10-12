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
    final List<dynamic> arrList = json['arrList'];
    List<CommentItem> commentItems = arrList.map((item) {
      return CommentItem.fromJson(item);
    }).toList();

    return CommentResponseModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: commentItems,
    );
  }
}

class CommentItem {
  final String id;
  final String chrStatus;
  final String strComment;
  final String strFlickId;
  final String strCreatedBy;
  final String strCreatedTime;
  final UserDetails userDetails;

  CommentItem({
    required this.id,
    required this.chrStatus,
    required this.strComment,
    required this.strFlickId,
    required this.strCreatedBy,
    required this.strCreatedTime,
    required this.userDetails,
  });

  factory CommentItem.fromJson(Map<String, dynamic> json) {
    return CommentItem(
      id: json['_id'],
      chrStatus: json['chrStatus'],
      strComment: json['strComment'],
      strFlickId: json['strFlickId'],
      strCreatedBy: json['strCreatedBy'],
      strCreatedTime: json['strCreatedTime'],
      userDetails: UserDetails.fromJson(json['userDetails']),
    );
  }
}

class UserDetails {
  final String id;
  final String strName;

  UserDetails({
    required this.id,
    required this.strName,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['_id'],
      strName: json['strName'],
    );
  }
}
