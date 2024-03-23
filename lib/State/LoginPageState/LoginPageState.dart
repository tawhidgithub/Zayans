import 'package:copy/Session%20Controller/SessionController.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/ProfileScreen.dart';
import 'package:copy/UI/MainScreen/mainScreen.dart';
import 'package:copy/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Profile State/profile state.dart';

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
  profileState profileController=Get.put(profileState());



  void Login() {
    setLoding(true);
    auth
        .signInWithEmailAndPassword(
            email: emailController.value.text,
            password: passController.value.text)
        .then((value) {
          profileController.setIsLogin(true);

        sessionController().userId=value.user!.uid.toString();


      Utils().ErrorMesege("Log In ");
    emailController.value.clear();
    passController.value.clear();

      Get.to(const MainSceen());

      setLoding(false);
    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());
      setLoding(false);
    });
  }
}
