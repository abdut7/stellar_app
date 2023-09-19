class PrivateMessageJsonModel {
  PrivateMessageJsonModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.privateMessageModelList,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<PrivateMessageModel> privateMessageModelList;
  
  PrivateMessageJsonModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    privateMessageModelList = List.from(json['arrList']).map((e)=>PrivateMessageModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['arrList'] = privateMessageModelList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PrivateMessageModel {
  PrivateMessageModel({
    required this.id,
    required this.strUserId,
    required this.strType,
    required this.strMessageType,
    required this.strMessage,
    required this.strName,
    required this.strIconURL,
    required this.strCreatedTime,
  });
  late final String id;
  late final String strUserId;
  late final String strType;
  late final String strMessageType;
  late final String strMessage;
  late final String strName;
  late final String strIconURL;
  late final String strCreatedTime;
  
  PrivateMessageModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    strUserId = json['strUserId'];
    strType = json['strType'];
    strMessageType = json['strMessageType'];
    strMessage = json['strMessage'];
    strName = json['strName'];
    strIconURL = json['strIconURL'];
    strCreatedTime = json['strCreatedTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['strUserId'] = strUserId;
    _data['strType'] = strType;
    _data['strMessageType'] = strMessageType;
    _data['strMessage'] = strMessage;
    _data['strName'] = strName;
    _data['strIconURL'] = strIconURL;
    _data['strCreatedTime'] = strCreatedTime;
    return _data;
  }
}