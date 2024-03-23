import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class profileState extends GetxController {

  var isLOGIN=false.obs;
   void setIsLogin(bool isLogin){
    isLOGIN.value=isLogin;
  }
  /// Is Login or Not


  DatabaseReference ref=FirebaseDatabase.instance.ref("User");



}