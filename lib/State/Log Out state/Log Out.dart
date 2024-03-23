import 'package:copy/Session%20Controller/SessionController.dart';
import 'package:copy/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Profile State/profile state.dart';

class LogOut extends GetxController {
  profileState profileController=Get.put(profileState());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logOut() {
    _auth.signOut().then((value) {
      sessionController().userId = "";
      profileController.setIsLogin(false);

      Utils().ErrorMesege("You've Been Log Out");
    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());
    });
  }
}
