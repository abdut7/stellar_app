class ChatHistoryModel {
  ChatHistoryModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.chatHistoryList,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<ChatHistoryList> chatHistoryList;

  ChatHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    chatHistoryList = List.from(json['arrList'])
        .map((e) => ChatHistoryList.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['arrList'] = chatHistoryList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ChatHistoryList {
  ChatHistoryList({
    required this.id,
    required this.strType,
    required this.strChatId,
    required this.strName,
    required this.strIconURL,
  });
  late final String id;
  late final String strType;
  late final String strChatId;
  late final String strName;
  late final String strIconURL;

  ChatHistoryList.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    strType = json['strType'];
    strChatId = json['strChatId'];
    strName = json['strName'];
    strIconURL = json['strIconURL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['strType'] = strType;
    _data['strChatId'] = strChatId;
    _data['strName'] = strName;
    _data['strIconURL'] = strIconURL;
    return _data;
  }
}
