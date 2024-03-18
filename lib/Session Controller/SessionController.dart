import 'package:copy/State/Profile%20State/profile%20state.dart';
import 'package:get/get.dart';

class sessionController{

static final sessionController _session=sessionController._internal();
profileState profileController=Get.put(profileState());

 String? userId;
 bool isLogin=false;
 void setDetx( ){
   profileController.setIsLogin(isLogin);
 }

factory sessionController(){
  return _session;
}
sessionController._internal(){

}
}




