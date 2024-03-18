import 'package:copy/Session%20Controller/SessionController.dart';
import 'package:copy/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LogOut extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logOut() {
    _auth.signOut().then((value) {
      sessionController().userId = "";
      sessionController().isLogin = false;
      sessionController().setDetx();
      Utils().ErrorMesege("You've Been Log Out");
    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());
    });
  }
}
