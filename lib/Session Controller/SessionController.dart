import 'package:copy/State/Profile%20State/profile%20state.dart';
import 'package:get/get.dart';

class sessionController{

static final sessionController _session=sessionController._internal();


 String? userId;


factory sessionController(){
  return _session;
}
sessionController._internal(){

}
}




