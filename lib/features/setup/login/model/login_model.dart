import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: 'success')
  final dynamic isSuccess;

  @JsonKey(name: 'message')
  final dynamic message;

  @JsonKey(name: 'statusCode')
  final dynamic statusCode;

  @JsonKey(name: 'strToken')
  final dynamic accessToken;

  @JsonKey(name: 'intUserId')
  final dynamic intUserId;

  @JsonKey(name: 'strEmail')
  final dynamic strEmail;

  @JsonKey(name: 'strFullName')
  final dynamic strFullName;

  @JsonKey(name: 'updatedBy')
  final dynamic updatedBy;

  @JsonKey(name: 'fkUserType')
  final dynamic fkUserType;

  @JsonKey(name: 'chrStatus')
  final dynamic chrStatus;

  @JsonKey(name: 'status')
  final dynamic status;

  @JsonKey(name: 'strMobile')
  final dynamic strMobile;

  @JsonKey(name: 'strImageUrl')
  final dynamic strImageUrl;

  LoginModel(
      {this.isSuccess,
      this.message,
      this.statusCode,
      this.accessToken,
      this.intUserId,
      this.strEmail,
      this.strFullName,
      this.updatedBy,
      this.fkUserType,
      this.chrStatus,
      this.status,
      this.strMobile,
      this.strImageUrl});

  factory LoginModel.fromJson(Map<String, dynamic> data) =>
      _$LoginModelFromJson(data);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
