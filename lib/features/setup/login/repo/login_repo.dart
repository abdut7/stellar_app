import 'package:base_project/features/setup/login/model/login_model.dart';

import 'package:base_project/services/web_api_services.dart';
import 'package:base_project/utils/urls.dart';
import 'package:dio/dio.dart';

extension LoginRepo on WebAPIService {
  Future<LoginModel> login(
      {required String username, required String password}) {
    return initTokenToHeader(initToken: false).then((value) => dio
        .post(urlLogin, data: {
          "strLoginId": username,
          "strPassword": password,
          "remember": true
        })
        .then(validateResStatusData)
        .then((value) {
          return LoginModel.fromJson(value as Map<String, dynamic>);
        })
        .catchError((ex) {
          onDioError(ex, 'login');
        }, test: (ex) => ex is DioError));
  }
}
