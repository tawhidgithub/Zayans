import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Session Controller/SessionController.dart';
import '../../State/Profile State/profile state.dart';
import '../MainScreen/mainScreen.dart';
class SplashServices{
  void inLogin(BuildContext context)async{
    profileState profileController=Get.put(profileState());

    FirebaseAuth auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user != null){
      sessionController().userId=user.uid.toString();
      profileController.setIsLogin(true);
      await Get.to(const MainSceen(),duration: const Duration(seconds: 2),transition: Transition.circularReveal );


    }else{
      sessionController().userId="";
      profileController.setIsLogin(false);
      await Get.to(const MainSceen(),duration: const Duration(seconds: 2),transition: Transition.circularReveal );

    }





  }
}