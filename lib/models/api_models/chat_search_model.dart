class SearchResponse {
  bool success;
  String message;
  int statusCode;
  List<SearchFiles> arrList;

  SearchResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    var arrList = json['arrList'] as List;
    List<SearchFiles> arrListItems =
        arrList.map((item) => SearchFiles.fromJson(item)).toList();

    return SearchResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      arrList: arrListItems,
    );
  }
}

class SearchFiles {
  String id;
  String? strContactNumbers;
  String? strContactName;
  String strUserId;
  String strType;
  String strMessageType;
  String strMessage;
  String strName;
  String strIconURL;
  String strCreatedTime;
  String strUrl;

  SearchFiles({
    required this.id,
    required this.strUrl,
    this.strContactNumbers,
    this.strContactName,
    required this.strUserId,
    required this.strType,
    required this.strMessageType,
    required this.strMessage,
    required this.strName,
    required this.strIconURL,
    required this.strCreatedTime,
  });

  factory SearchFiles.fromJson(Map<String, dynamic> json) {
    return SearchFiles(
        id: json['_id'] as String,
        strContactNumbers: json['strContactNumbers'] as String?,
        strContactName: json['strContactName'] as String?,
        strUserId: json['strUserId'] as String,
        strType: json['strType'] as String,
        strMessageType: json['strMessageType'] as String,
        strMessage: json['strMessage'] as String,
        strName: json['strName'] as String,
        strIconURL: json['strIconURL'] as String,
        strCreatedTime: json['strCreatedTime'] as String,
        strUrl: json['strUrl'] ?? "");
  }
}
