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
  
  GroupMessageResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    groupMessageModel = List.from(json['arrList']).map((e)=>GroupMessageModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    _data['arrList'] = groupMessageModel.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class GroupMessageModel {
  GroupMessageModel({
    required this.id,
    required this.strUserId,
    required this.strType,
    required this.strMessage,
    required this.strMessageType,
    required this.strName,
    required this.strIconURL,
    required this.strCreatedTime,
  });
  late final String id;
  late final String strUserId;
  late final String strType;
  late final String strMessage;
  late final String strMessageType;
  late final String strName;
  late final String strIconURL;
  late final String strCreatedTime;
  
  GroupMessageModel.fromJson(Map<String, dynamic> json){
  id = json['_id'];
    strUserId = json['strUserId'];
    strType = json['strType'];
    strMessage = json['strMessage'];
    strMessageType = json['strMessageType'];
    strName = json['strName'];
    strIconURL = json['strIconURL']??"";
    strCreatedTime = json['strCreatedTime'];
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