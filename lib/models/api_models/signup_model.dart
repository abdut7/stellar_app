import 'dart:convert';

import 'package:flutter/foundation.dart';

class SignupModel {
  String username;
  String filePath;
  String fullName;
  String email;
  String birthday;
  String region;
  String phoneNumber;
  String password;
  List<String> coordinates;
  SignupModel({
    required this.username,
    required this.filePath,
    required this.fullName,
    required this.email,
    required this.birthday,
    required this.region,
    required this.phoneNumber,
    required this.password,
    required this.coordinates,
  });

  SignupModel copyWith({
    String? username,
    String? filePath,
    String? fullName,
    String? email,
    String? birthday,
    String? region,
    String? phoneNumber,
    String? password,
    List<String>? coordinates,
  }) {
    return SignupModel(
      username: username ?? this.username,
      filePath: filePath ?? this.filePath,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      region: region ?? this.region,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'filePath': filePath});
    result.addAll({'fullName': fullName});
    result.addAll({'email': email});
    result.addAll({'birthday': birthday});
    result.addAll({'region': region});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'password': password});
    result.addAll({'coordinates': coordinates});

    return result;
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      username: map['username'] ?? '',
      filePath: map['filePath'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      birthday: map['birthday'] ?? '',
      region: map['region'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      password: map['password'] ?? '',
      coordinates: List<String>.from(map['coordinates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignupModel(username: $username, fullName: $fullName, email: $email, birthday: $birthday, region: $region, phoneNumber: $phoneNumber, password: $password, coordinates: $coordinates, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignupModel &&
        other.username == username &&
        other.filePath == filePath &&
        other.fullName == fullName &&
        other.email == email &&
        other.birthday == birthday &&
        other.region == region &&
        other.phoneNumber == phoneNumber &&
        other.password == password &&
        listEquals(other.coordinates, coordinates);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        filePath.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        birthday.hashCode ^
        region.hashCode ^
        phoneNumber.hashCode ^
        password.hashCode ^
        coordinates.hashCode;
  }
}
