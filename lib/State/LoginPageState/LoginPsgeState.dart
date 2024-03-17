import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenState with ChangeNotifier {

  // Obscure Text

  bool _eyes = true;

  get Eyes => _eyes;

  void setEyes() {
    if (_eyes == false) {
      _eyes = true;
    } else if (_eyes == true) {
      _eyes = false;
    }

    notifyListeners();
  }

// Login


}






