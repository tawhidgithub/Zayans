import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/ProfileScreen.dart';
import 'package:copy/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Session Controller/SessionController.dart';

class SignUpScreenState with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("User");

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
}

///Sing up

class SingUpState extends GetxController {
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passController = TextEditingController().obs;
  final Rx<TextEditingController> firstNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> lastNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> userNameController =
      TextEditingController().obs;

  // Loging
  RxBool logind = false.obs;

  void setLoding(bool lod) {
    logind.value = lod;
  }

  /// Sing Up

  final _auth = FirebaseAuth.instance;
  DatabaseReference ref=FirebaseDatabase.instance.ref("User");

  void singUp() {
    // var ID=DateTime.now().microsecondsSinceEpoch.toString();
    setLoding(true);
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.value.text,
            password: passController.value.text)
        .then((value) {
      sessionController().setDetx();


      ref.child(value.user!.uid.toString()).set({
        "id":value.user!.uid.toString(),

        "email":value.user!.email.toString(),
        "password":passController.value.text.toString(),
        "username":userNameController.value.text.toString(),
        "fullname":firstNameController.value.text.toString() +""+lastNameController.value.text.toString(),
        "image":"",
        "phone":""



      })
          .then((value) {


      })
          .onError((error, stackTrace) {

      });
      Utils().ErrorMesege("Register is Successful");
      Get.to(const ProfileScreen(),duration: const Duration(seconds: 2));

      setLoding(false);
    }).onError((error, stackTrace) {
      setLoding(false);
      Utils().ErrorMesege(error.toString());



    });
  }
}
