import '/utils/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/utils/sp_keys.dart' as sp_keys;

mixin WebAPIMixin {
  /// Returns the token from Shared Preference
  /// Token is saved as key pair of [keyToken]
  /// Throws exception in case of any error
  Future<String?> getTokenFromSharedPref() => SharedPreferences.getInstance()
      .then<String?>((sp) => sp.getString(sp_keys.keyToken));

  /// Returns opted language code from Shared Preference
  /// Token is saved as key pair of [keyLanguageCode]
  /// Throws exception in case of any error
  Future<String?> getLanguageSharedPref() {
    return SharedPreferences.getInstance().then<String?>(
      (sp) => sp.getString(sp_keys.keyLanguageCode),
    );
  }

  /// Returns opted Tenant code from Shared Preference
  /// Token is saved as key pair of [keyTenantCode]
  /// Throws exception in case of any error
  Future<String?> getTenantCodeSharedPref() {
    return SharedPreferences.getInstance().then<String?>(
      (sp) => sp.getString(sp_keys.keyTenantCode),
    );
  }

  /// Handle the dio error in call
  void onDioError(DioError error, String apiName) {
    String? msg;
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.other:
        msg = "Please check your internet connection and try again";
        break;
      case DioErrorType.response:

        /// Check the api response has data
        if (error.response?.data == null) {
          throw APIException(
              enumProperty: EnumAPIExceptions.httpStatusError,
              message: msg ?? "$apiName:${error.message}",
              otherData: [error.error]);
        }

        if (error.response!.data is Map) {
          final Map data = error.response!.data;
          if (data.containsKey('Message')) {
            if (data['message'] == 'Unauthenticated') {
              throw APIException(
                  enumProperty: EnumAPIExceptions.invalidToken,
                  message: 'Token expired');
            }

            throw APIException(
              enumProperty: EnumAPIExceptions.dataSuccessFalse,
              message: data['Message'],
              data: error.response,
            );
          }

          if (data.containsKey('StatusDesc')) {
            if ([
              "invalid session",
              "invalid session.",
              "not a valid session",
              "not a valid session.",
            ].contains(data["StatusDesc"]?.toString().toLowerCase())) {
              throw APIException(
                enumProperty: EnumAPIExceptions.invalidToken,
                message: data['StatusDesc'],
                data: error.response,
              );
            }
          }

          if (data.containsKey('message')) {
            if (data['message'] == 'Unauthenticated') {
              throw APIException(
                enumProperty: EnumAPIExceptions.invalidToken,
                message: 'Token expired',
                data: error.response,
              );
            }

            throw APIException(
              enumProperty: EnumAPIExceptions.dataSuccessFalse,
              message: data['message'],
              data: error.response,
            );
          }
        }

        break;
      case DioErrorType.cancel:
        msg = "The request has been cancelled.";
        break;
    }
    throw APIException(
        enumProperty: EnumAPIExceptions.httpStatusError,
        message: msg ?? "$apiName:${error.message}",
        otherData: [error.response?.data]);
  }

  Future<Map> validateResStatusData(Response<dynamic> response) async {
    if (response.data == null) {
      throw APIException(
          enumProperty: EnumAPIExceptions.apiResultEmpty,
          message: "The response is empty from server");
    }

    if (response.data is! Map) {
      throw APIException(
          enumProperty: EnumAPIExceptions.invalidResultType,
          message: "Invalid result type from API response");
    }

    final Map data = response.data;

    if (data.containsKey("status")) {
      if (data["statusCode"]?.toString() == "500") {
        String? msg = "API response error from server";
        if (data.containsKey("message") &&
            (data["message"]?.toString().isNotEmpty ?? false)) {
          msg = data["message"];
        }
        throw APIException(
            enumProperty: EnumAPIExceptions.dataSuccessFalse,
            message: msg ?? '');
      }

      if (data["statusCode"]?.toString() == "422") {
        String? msg = "Validation Error";
        if (data.containsKey("message") &&
            (data["message"]?.toString().isNotEmpty ?? false)) {
          msg = data["message"];
        }
        throw APIException(
            enumProperty: EnumAPIExceptions.dataSuccessFalse,
            message: msg ?? '');
      }
    }

    return data;
  }
}
