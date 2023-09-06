import 'package:base_project/features/setup/login/model/login_model.dart';
import 'package:base_project/features/setup/login/repo/login_repo.dart';
import 'package:base_project/helpers/sp_helper.dart';
import 'package:base_project/providers/_base.dart';
import 'package:base_project/services/web_api_services.dart';
import 'package:base_project/utils/sp_keys.dart';
import 'package:flutter/widgets.dart';

class LoginProvider extends BaseSimpleAPIProvider<LoginModel?> {
  String username;
  String password;

  LoginProvider({required this.username, required this.password});

  @override
  Future<LoginModel?> apiService() {
    return WebAPIService().login(username: username, password: password);
  }
}
