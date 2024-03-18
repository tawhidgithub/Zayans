import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Session Controller/SessionController.dart';
import '../MainScreen/mainScreen.dart';
class SplashServices{
  void inLogin(BuildContext context)async{

    FirebaseAuth auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user != null){
      sessionController().userId=user.uid.toString();
      sessionController().isLogin=true;
      await Get.to(const MainSceen(),duration: const Duration(seconds: 2),transition: Transition.circularReveal );


    }else{
      sessionController().userId="";
      sessionController().isLogin=false;
      await Get.to(const MainSceen(),duration: const Duration(seconds: 2),transition: Transition.circularReveal );

    }





  }
}