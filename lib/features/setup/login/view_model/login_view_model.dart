import 'package:base_project/features/setup/login/model/login_model.dart';
import 'package:base_project/features/setup/login/repo/providers/login_provider.dart';
import 'package:base_project/providers/view_model.dart';
import 'package:base_project/utils/app_build_methods.dart';
import 'package:base_project/utils/extensions.dart';

class LoginViewmodel extends ViewModel {
  String? _username;
  String? _password;

  String? get username => _username;
  String? get password => _password;

  set username(String? name) {
    _username = name;
    notifyListeners();
  }

  set password(String? pass) {
    _password = pass;
    notifyListeners();
  }

  Future<LoginModel?> login() async {
    return await LoginProvider(username: username!, password: password!)
        .fetchFromAPIService(
      onShowError: (msg, [asToast]) {
        showToast(msg);
      },
      onSuccess: (m) {
        if (m != null) {
          //print(m.accessToken);
          showToast(m.message);
        }
      },
    ).setProgress(this);
  }
}
