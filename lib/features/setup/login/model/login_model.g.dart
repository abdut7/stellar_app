// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      isSuccess: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      accessToken: json['strToken'],
      intUserId: json['intUserId'],
      strEmail: json['strEmail'],
      strFullName: json['strFullName'],
      updatedBy: json['updatedBy'],
      fkUserType: json['fkUserType'],
      chrStatus: json['chrStatus'],
      status: json['status'],
      strMobile: json['strMobile'],
      strImageUrl: json['strImageUrl'],
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'success': instance.isSuccess,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'strToken': instance.accessToken,
      'intUserId': instance.intUserId,
      'strEmail': instance.strEmail,
      'strFullName': instance.strFullName,
      'updatedBy': instance.updatedBy,
      'fkUserType': instance.fkUserType,
      'chrStatus': instance.chrStatus,
      'status': instance.status,
      'strMobile': instance.strMobile,
      'strImageUrl': instance.strImageUrl,
    };
