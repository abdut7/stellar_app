class PrivateMessageJsonModel {
  PrivateMessageJsonModel(
      {required this.success,
      required this.message,
      required this.statusCode,
      required this.privateMessageModelList,
      required this.isBlocked});
  late final bool success;
  late final String message;
  late final int statusCode;
  late final bool isBlocked;
  late final List<PrivateMessageModel> privateMessageModelList;

  PrivateMessageJsonModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    isBlocked = json['isBlocked'] ?? false;
    privateMessageModelList = List.from(json['arrList'])
        .map((e) => PrivateMessageModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['arrList'] = privateMessageModelList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PrivateMessageModel {
  PrivateMessageModel(
      {required this.id,
      required this.strUserId,
      required this.strType,
      required this.strMessageType,
      required this.strMessage,
      required this.strName,
      required this.strCreatedTime,
      required this.strContactName,
      required this.strChatId,
      required this.strContactNumbers,
      required this.strUrl,
      required this.strLatitude,
      required this.strLongitude});
  late final String id;
  late final String strUserId;
  late final String strType;
  late final String strMessageType;
  late final String strMessage;
  late final String strName;
  late final String strContactNumbers;
  late final String strContactName;
  late final String strCreatedTime;
  late final String strUrl;
  late final String strChatId;
  late final double strLatitude;
  late final double strLongitude;

  PrivateMessageModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    strUserId = json['strUserId'];
    strType = json['strType'];
    strMessageType = json['strMessageType'];
    strMessage = json['strMessage'];
    strName = json['strName'];
    strCreatedTime = json['strCreatedTime'];
    strContactNumbers = json['strContactNumbers'] ?? "";
    strContactName = json['strContactName'] ?? "";
    strUrl = json.containsKey('strUrl') ? json['strUrl'] : '';
    strChatId = json['strChatId'] ?? "";
    strLongitude = json['strLongitude'] ?? 0.0;
    strLatitude = json['strLatitude'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['strUserId'] = strUserId;
    _data['strType'] = strType;
    _data['strMessageType'] = strMessageType;
    _data['strMessage'] = strMessage;
    _data['strName'] = strName;
    _data['strCreatedTime'] = strCreatedTime;
    return _data;
  }

  @override
  String toString() {
    return 'PrivateMessageModel{'
        'id: $id, '
        'strUserId: $strUserId, '
        'strType: $strType, '
        'strMessageType: $strMessageType, '
        'strMessage: $strMessage, '
        'strName: $strName, '
        'strContactNumbers: $strContactNumbers, '
        'strContactName: $strContactName, '
        'strCreatedTime: $strCreatedTime, '
        'strUrl: $strUrl, '
        'strChatId: $strChatId, '
        'strLatitude: $strLatitude, '
        'strLongitude: $strLongitude}';
  }
}
