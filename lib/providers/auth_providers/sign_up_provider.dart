
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isErrorOccured = false;
  String errorMessage = "";
  bool? isSignupSuccess;

  void loading(bool loading) {
    isLoading = loading;
    print(isLoading);
    notifyListeners();
  }

  void signupSuccess(bool? isSuccess) {
    isSignupSuccess = isSuccess;
    notifyListeners();
  }

  void errorOccured(bool iserrorOcured, String errorMsg) {
    isErrorOccured = iserrorOcured;
    errorMessage = errorMsg;
    notifyListeners();
  }
}
