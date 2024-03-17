class sessionController{

static sessionController _session=sessionController._internal();

 String? userId;
 bool isLogin=false;

factory sessionController(){
  return _session;
}
sessionController._internal(){

}
}




