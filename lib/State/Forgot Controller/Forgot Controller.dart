import 'package:copy/Session%20Controller/SessionController.dart';
import 'package:copy/UI/MainScreen/OtherScreen/LoginScreen/LoginScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/ProfileScreen.dart';
import 'package:copy/UI/MainScreen/mainScreen.dart';
import 'package:copy/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Profile State/profile state.dart';



class ForgotController extends GetxController {
  final Rx<TextEditingController> emailController = TextEditingController().obs;

  /// Loding
  RxBool loding = false.obs;

  void setLoding(bool lod) {
    loding.value = lod;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  profileState profileController=Get.put(profileState());



  void recoverPassword() {
    setLoding(true);

    try{
      auth
          .sendPasswordResetEmail(
        email: emailController.value.text,

      ).then((value) {

        Utils().ErrorMesege("Please Check Your Email ");

        Get.to( LoginScreen());

        setLoding(false);
      }).onError((error, stackTrace) {
        Utils().ErrorMesege(error.toString());
        setLoding(false);
      });
    }catch(e){
      Utils().ErrorMesege(e.toString());
    }



  }
}
