import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/First Screen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/Secend Screen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/Threed Screen.dart';

class adminState extends GetxController {
  // Pop Up Value Change
  RxInt Value = 1.obs;

  void setvalue(int val) {
    Value.value = val;
  }

  RxList Screen = [
    adminFirstScreen(),
    const adminSecendScreen(),
    const adminThreedScreen()
  ].obs;

//Controller for Input Text Field
  final Rx<TextEditingController> inputController = TextEditingController().obs;

  /// Image picker from Gallery for Upload product
  RxList<XFile> ImageList = <XFile>[].obs;

  Future picImage() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? images = await _picker.pickMultiImage();
    if (images!.isNotEmpty) {
      ImageList.addAll(images);
    }
  }

  /// Image picker from Gallery for Shop Adds
  RxString imagePath = "".obs;

  Future picImage2() async {
    final ImagePicker _pikImage = ImagePicker();
    final image2= await _pikImage.pickImage(source: ImageSource.gallery);
    if(image2!=null){
      imagePath.value=image2.path;

    }

  }





/// Image picker from Gallery for Home Page Adds
RxList<XFile> ImagesPath=<XFile>[].obs;
  Future picImage3()async{
    final ImagePicker picker3=ImagePicker();
     List<XFile> images3= await picker3.pickMultiImage();
    if(images3!=null ){
      ImagesPath.addAll(images3);
    }
  }



  /// Threed Screen
RxList User=[].obs;






  /// Upload Data Category
  RxBool isSelectBaby=false.obs;
  RxBool isSelectMan=false.obs;
  RxBool isSelectWomen=false.obs;
  RxBool isSelectFood=false.obs;
  RxBool isSelectToy=false.obs;

  void setIsSelect( String category){
    if ( category=="Baby" && isSelectBaby.value==false){
      isSelectBaby.value=true;
      isSelectMan.value=false;
      isSelectWomen.value=false;
      isSelectFood.value=false;
      isSelectToy.value=false;

    }else if(category=="Man"&& isSelectMan.value==false){
      isSelectBaby.value=false;
      isSelectMan.value=true;
      isSelectWomen.value=false;
      isSelectFood.value=false;
      isSelectToy.value=false;

    }else if(category=="Women"&&isSelectWomen.value==false){
      isSelectBaby.value=false;
      isSelectMan.value=false;
      isSelectWomen.value=true;
      isSelectFood.value=false;
      isSelectToy.value=false;

    }else if(category=="Food" &&isSelectFood.value==false){
      isSelectBaby.value=false;
      isSelectMan.value=false;
      isSelectWomen.value=false;
      isSelectFood.value=true;
      isSelectToy.value=false;

    }else if(category=="Toy"&&isSelectToy.value==false){
      isSelectBaby.value=false;
      isSelectMan.value=false;
      isSelectWomen.value=false;
      isSelectFood.value=false;
      isSelectToy.value=true;

    }



  }



}
