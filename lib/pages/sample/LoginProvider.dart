import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String name;
  String pass;

  bool nameValid = false;
  bool passValid = false;

  changeNameStatus(String name) {
    this.name = name;
    nameValid = name != null && name.isNotEmpty ? true : false;
    notifyListeners();
  }

  changePassStatus(String pass) {
    this.pass = pass;
    passValid = pass != null && pass.isNotEmpty ? true : false;
    notifyListeners();
  }

  bool getStatus() {
    return nameValid && passValid;
  }
}
