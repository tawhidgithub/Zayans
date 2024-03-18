import 'package:get/get.dart';

class profileState extends GetxController {

  var isLOGIN=false.obs;
   void setIsLogin(bool isLogin){
    isLOGIN.value=isLogin;
  }


}