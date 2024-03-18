import 'package:copy/Session%20Controller/SessionController.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/ProfileScreen.dart';
import 'package:copy/Utils/Utils.dart';
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

class LoginState extends GetxController {
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passController = TextEditingController().obs;

  /// Loding
  RxBool loding = false.obs;

  void setLoding(bool lod) {
    loding.value = lod;
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void Login() {
    setLoding(true);
    auth
        .signInWithEmailAndPassword(
            email: emailController.value.text,
            password: passController.value.text)
        .then((value) {
      Utils().ErrorMesege("Log In ");
      sessionController().setDetx();
      Get.to(const ProfileScreen());

      setLoding(false);
    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());
      setLoding(false);
    });
  }
}
