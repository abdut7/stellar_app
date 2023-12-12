class GroupMessageResponseModel {
  GroupMessageResponseModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.groupMessageModel,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<GroupMessageModel> groupMessageModel;

  GroupMessageResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    groupMessageModel = List.from(json['arrList'])
        .map((e) => GroupMessageModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['arrList'] = groupMessageModel.map((e) => e.toJson()).toList();
    return _data;
  }
}

class GroupMessageModel {
  GroupMessageModel(
      {required this.id,
      required this.strUserId,
      required this.strType,
      required this.strMessage,
      required this.strMessageType,
      required this.strName,
      required this.strIconURL,
      required this.strCreatedTime,
      required this.strContactName,
      required this.strChatId,
      required this.strContactNumbers,
      required this.strLatitude,
      required this.strLongitude,
      required this.strContactId,
      this.strContactUrl,
      this.strContactFullName,
      required this.strUrl});
  late final String id;
  late final String strUserId;
  late final String strType;
  late final String strMessage;
  late final String strMessageType;
  late final String strName;
  late final String strIconURL;
  late final String strCreatedTime;
  late final String strUrl;
  late final String strContactName;
  late final String strChatId;
  late final String strContactNumbers;
  late final double strLatitude;
  late final double strLongitude;
  late final String? strContactId;
  late final String? strContactUrl;
  late final String? strContactFullName;

  GroupMessageModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    strUserId = json['strUserId'];
    strType = json['strType'];
    strMessage = json['strMessage'];
    strMessageType = json['strMessageType'];
    strName = json['strName'];
    strIconURL = json['strIconURL'] ?? "";
    strCreatedTime = json['strCreatedTime'];
    strUrl = json['strUrl'] ?? "";
    strContactNumbers = json['strContactNumbers'] ?? "";
    strContactName = json['strContactName'] ?? "";
    // strUrl = json.containsKey('strUrl') ? json['strUrl'] : '';
    strChatId = json['strChatId'] ?? "";
    strLongitude = json['strLongitude'] ?? 0.0;
    strLatitude = json['strLatitude'] ?? 0.0;
    strContactId = json['strContactId'];
    strContactUrl = json['strContactUrl'];
    strContactFullName = json['strContactFullName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['strUserId'] = strUserId;
    _data['strType'] = strType;
    _data['strMessage'] = strMessage;
    _data['strMessageType'] = strMessageType;
    _data['strName'] = strName;
    _data['strIconURL'] = strIconURL;
    _data['strCreatedTime'] = strCreatedTime;
    return _data;
  }
}
